#!/usr/bin/env python3
# Tool to scan Pokemon ASM files, to validate
# if text lengths seem to be correct.
# It accepts either a single file, or a directory.

import os
import random
import re
import sys


def get_line_and_column(file_contents, index):
    # Get the line and column of a given index.
    # First find the last newline before the index.
    last_newline = file_contents.rfind("\n", 0, index)
    if last_newline == -1:
        # If there's no newline, the index is on the first line.
        return (1, index + 1)
    # Count the number of newlines before the index.
    line = file_contents.count("\n", 0, last_newline) + 2
    # Count the number of characters from the last newline to the index.
    column = index - last_newline
    return (line, column)


def print_something(severity, file_path, line, column, category, message, end_line, end_column):
    end = ""
    if end_line is not None and end_line >= line:
        if end_column is None and end_line > line:
            end = f"({end_line}:{end_column})"
        elif end_column is not None and end_column >= column:
            end = f"({end_line}:{end_column})"
    print(f"{file_path}:{line}:{column}: {severity}: [{category}] {message}")


def print_error(file_path, line, column, category, message, end_line=None, end_column=None):
    print_something("error", file_path, line, column,
                    category, message, end_line, end_column)


def print_warning(file_path, line, column, category, message, end_line=None, end_column=None):
    print_something("warning", file_path, line, column,
                    category, message, end_line, end_column)


def print_info(file_path, line, column, category, message, end_line=None, end_column=None):
    print_something("info", file_path, line, column,
                    category, message, end_line, end_column)


# Map of replacements for the text
replacements = {
    "#": "POKé",
    "<PLAYER>": "PLAYER_",
    "<PK>": "P",
    "<MN>": "M",
    "<DOT>": ".",
    "<RIVAL>": "RIVAL__",
    "<COLON>": ":",
    "<USER>": "CHARMANDER",
}


def preprocess_line(input):
    # Replace all the text replacements
    for key, value in replacements.items():
        input = input.replace(key, value)
    return input


variable_dummies = {
    "wOaksAideRewardItemName": "ITEM_NAME___",
    "wTrainerName": "COOLTRAINER♂",
    "wLinkEnemyTrainerName": "TRAINER",
    "wGymCityName": "CINNABAR ISLAND",
    "wGymLeaderName": "GIOVANNI",
    "wBoxNumString": "12",
    "wBoxMonNicks": "POKENICKNAME",
}

long_mon_names = [
    "KANGASKHAN",
    "MISSINGNO.",
    "JIGGLYPUFF",
    "WIGGLYTUFF",
    "BUTTERFREE",
    "TENTACRUEL",
    "AERODACTYL",
    "CHARMANDER",
    "CHARMELEON",
    "BELLSPROUT",
    "WEEPINBELL",
    "VICTREEBEL"
]

hm_tm_lookup = {
    "HM01": "CUT",
    "HM02": "FLY",
    "HM03": "SURF",
    "HM04": "STRENGTH",
    "HM05": "FLASH",
    "TM06": "TOXIC",
    "TM11": "BUBBLEBEAM",
    "TM13": "ICE BEAM",
    "TM18": "COUNTER",
    "TM21": "MEGA DRAIN",
    "TM29": "PSYCHIC",
    "TM35": "METRONOME",
    "TM38": "FIRE BLAST",
    "TM39": "SWIFT",
    "TM48": "ROCK SLIDE",
    "TM49": "TRI ATTACK",
}


def lookup_ram_variable(dialog_name, variable):
    if variable in variable_dummies:
        return variable_dummies[variable]

    if variable.endswith("MonName") or variable.endswith("MonToBeTraded"):
        return random.choice(long_mon_names)

    if variable.endswith("MonNick") or variable.endswith("MonNicks"):
        # Maximum nick name is 12 characters
        return "POKENICKNAME"

    # Contains ItemName?
    if variable.endswith("ItemName"):
        # Maximum item name is assumed to be 12 characters
        return "ITEM_NAME___"

    # In case variable is not known, we check the dialog name for hints.
    # - Name rater or something with a Pokemon? Assume it's a Pokemon name.
    if dialog_name.startswith("_NameRaters") or dialog_name.startswith("_MonWas") or dialog_name.startswith("_MonIs"):
        # Maximum nick name is 12 characters
        return "POKENICKNAME"

    # - ItemText
    if dialog_name.endswith("ItemText"):
        # Maximum item name is assumed to be 12 characters
        return "ITEM_NAME___"

    # - Starts with _Daycare / _Trade? Assume it's a Pokemon name.
    if dialog_name.startswith("_Daycare") or dialog_name.startswith("_Trade"):
        return random.choice(long_mon_names)

    # - Received TM / HM? Typically just the TM/HM name.
    move = re.search("Received([HT]M\d{2})Text$", dialog_name)
    if move is not None:
        return move.group(1)

    # - Explanation TM / HM? Typically just the TM/HM name.
    move = re.search("([HT]M\d{2})ExplanationText$", dialog_name)
    if move is not None:
        return move.group(1)

    # - HM/TMs?
    move = re.search("[_A-Za-z0-9]+([HT]M\d{2})Text$", dialog_name)
    if move is not None:
        item_name = move.group(1)
        # Check if found in lookup
        if item_name in hm_tm_lookup:
            return hm_tm_lookup[item_name]
        else:
            print_info(__file__, 89, 1, 'parser',
                       "Lookup for HM/TM not found: " + item_name)
            return None

    # - Received Item?
    item = re.search("Received([A-Za-z]+)Text$", dialog_name)
    if item is not None:
        # TODO: Might need lookup in the future. For now just assume name from dialog name.
        return item.group(1).upper()

    # - On route 23, they mainly care about badges.
    if re.search("^_Route23.+Badge.*Text$", dialog_name):
        return "RAINBOWBADGE"

    # - TrainerName?
    if dialog_name.find("TrainerName") >= 0:
        return "COOLTRAINER♂"

    return None


def check_length(file_path, max_length, text, line, column, end_line, end_column):
    if len(text) > max_length:
        print_error(file_path, line, column, 'length',
                    f"Line too long ({len(text)} > {max_length}): '{text}'", end_line, end_column)


def scan_text_dialogs(file_contents, file_path):
    # Constants for maximum text lengths
    MAX_LENGTH_FIRST_LINE = 18
    MAX_LENGTH_OTHER_LINE = MAX_LENGTH_FIRST_LINE - 1
    dialogs = re.finditer(
        "^([_a-z][a-z0-9_]+)::\s*$(\s+text.+$)(\s+([a-z_]+($|\s+[^\n]+$)))+", file_contents, re.M | re.I)
    for dialog in dialogs:
        # Access the match object and its location
        name = dialog.group(1)

        # If name ends with "DexEntry", it's a Pokedex entry, so we skip those for now.
        if name.endswith("DexEntry"):
            continue

        # (line, column) = get_line_and_column(file_contents, dialog.start())
        # (end_line, end_column) = get_line_and_column(file_contents, dialog.end())

        # Extract the text lines from entire match
        lines = re.finditer(
            "^\s+(([a-z]+)\s+\"([^\"]+)\"|(text_ram|text_bcd|text_decimal)\s+([a-z0-9_]+)\s*(.*)|(text_end|prompt|done))$", dialog.group(), re.M | re.I)

        # Store information on previous line
        text_line = 0
        text_column = 0
        text_end_line = 0
        text_end_column = 0
        type = ""
        pre = ""
        delayed_warning = False
        first_line = True
        check_next = False
        collected_text = ""
        for line in lines:

            current_line, current_column = get_line_and_column(
                file_contents, dialog.start() + line.start())

            type = line.group(2) or line.group(4) or line.group(7)

            likely_last_line = False
            if type == "text_end" or type == "prompt" or type == "done":
                likely_last_line = True

            if delayed_warning:
                delayed_warning = False
                if not likely_last_line:
                    check_length(file_path, MAX_LENGTH_OTHER_LINE, pre,
                                 text_line, text_column, text_end_line, text_end_column)

            if type == "text_bcd":
                group6 = line.group(6)
                try_match = re.match(",\s*(\d+)\s*", group6, re.I | re.M)
                num_input = None
                if try_match is None:
                    if group6.endswith('$c3'):
                        # For now assume 3
                        num_input = '3'
                    else:
                        print_info(file_path, current_line, current_column, 'parser',
                                   f"Invalid BCD format: '{group6}'")
                        continue
                else:
                    num_input = try_match.group(1)
                expected_length = int(num_input)
                check_next = True
                for i in range(expected_length):
                    collected_text += "X"
                continue

            if type == "text_decimal":
                # Find number after last comma in group 6
                group6 = line.group(6)
                comma_index = group6.rfind(",")
                if comma_index < 0:
                    print_info(file_path, current_line, current_column, 'parser',
                               f"Invalid decimal format: '{group6}'")
                    continue
                # Substring for everything after last comma
                expected_length = int(group6[comma_index + 1:].strip())
                check_next = True
                for i in range(expected_length):
                    collected_text += "X"
                continue

            if type == "text_ram":
                variable = line.group(5)
                var_value = lookup_ram_variable(name, variable)
                if var_value is None:
                    print_info(file_path, current_line, current_column, 'parser',
                               f"Unknown variable '{variable}' in '{name}'")
                else:
                    check_next = True
                    collected_text += var_value
                continue

            if likely_last_line or type == "para" or type == "line" or type == "cont":
                if check_next:
                    max = MAX_LENGTH_FIRST_LINE if first_line else MAX_LENGTH_OTHER_LINE
                    check_length(file_path, max, collected_text, text_line,
                                 text_column, text_end_line, text_end_column)
                check_next = False
                collected_text = ""

            if likely_last_line:
                # Probably the last line, but at least nothing to check
                continue

            text = line.group(3)
            if text is None:
                line_no, column = get_line_and_column(
                    file_contents, dialog.start() + line.start())
                end_line, end_column = get_line_and_column(
                    file_contents, dialog.start() + line.end())
                print_warning(file_path, line_no, column, f'parser',
                              f"Unexpected none for type {type}", end_line, end_column)
                continue
            if not check_next:
                (text_line, text_column) = get_line_and_column(
                    file_contents, dialog.start() + line.start(2))

            (text_end_line, text_end_column) = get_line_and_column(
                file_contents, dialog.start() + line.end(2))
            pre = preprocess_line(text)

            if pre.endswith("@"):
                # Check in next iteration
                check_next = True
                collected_text += pre[:-1]
                continue

            if type == "text":
                check_next = True
                collected_text += pre
                continue

            check_next = False
            if type == "para":
                check_length(file_path, MAX_LENGTH_FIRST_LINE, pre,
                             text_line, text_column, text_end_line, text_end_column)
            elif type == "cont" or type == "line":
                if len(pre) == MAX_LENGTH_FIRST_LINE:
                    # Only complain if this is not the last line
                    delayed_warning = True
                else:
                    check_length(file_path, MAX_LENGTH_FIRST_LINE,
                                 pre, text_line, text_column, text_end_line, text_end_column)


def scan_file(file_path):
    # Open the file and read it into a string
    file_contents = ""
    with open(file_path, "r", encoding="utf-8") as file:
        file_contents = file.read()
        scan_text_dialogs(file_contents, file_path)


# Main
def main():
    # Iterate over the arguments, and scan each one.
    # If no arguments are given, take the current directory.
    args = sys.argv[1:]
    if len(args) == 0:
        args = ["."]
    for file_path in args:
        print("Scan: " + file_path)
        # If it's a file, scan it. If it's a directory, scan all .asm files in it (and its subdirectories).
        if os.path.isfile(file_path):
            scan_file(file_path)
        elif os.path.isdir(file_path):
            for root, dirs, files in os.walk(file_path):
                for file in files:
                    if file.endswith(".asm"):
                        scan_file(os.path.join(root, file))


if __name__ == "__main__":
    main()
