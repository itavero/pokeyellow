_FileDataDestroyedText::
	text "Opgeslagen voort-"
	line "gang is beschadigd"
	prompt

_WouldYouLikeToSaveText::
	text "Wil je jouw voort-"
	line "gang opslaan?"
	done

_SavingText::
	text "Bezig met"
	line "opslaan..."
	done

_GameSavedText::
	text "<PLAYER>'s voort-"
	line "gang is opgeslagen"
	done

_OlderFileWillBeErasedText::
	text "Eerder opgeslagen"
	line "voortgang wordt"
	cont "overschreven. OK?"
	done

_WhenYouChangeBoxText::
	text "Wanneer je wisselt"
	line "van #MON BOX,"
	cont "wordt je voort-"
	cont "gang opgeslagen."

	para "Is dat goed?"
	done

_ChooseABoxText::
	text "Kies een"
	line "<PKMN> BOX.@"
	text_end

_EvolvedText::
	text_ram wStringBuffer
	text " werd"
	done

_IntoText::
	text_start
	line "een @"
	text_ram wcd6d
	text "!"
	done

_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer
	text_start
	line "is gestopt met"
	cont "evolueren!"
	prompt
