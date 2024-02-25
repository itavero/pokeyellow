_EnemyAppearedText::
	text_ram wEnemyMonNick
	text_start
	line "verscheen!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text " wil"
	line "vechten!"
	prompt

_UnveiledGhostText::
	text "SILPH SCOPE"
	line "unveiled the"
	cont "GHOST's identity!"
	prompt

_GhostCantBeIDdText::
	text "Darn! The GHOST"
	line "can't be ID'd!"
	prompt

_GoText::
	text "Ik kies jou,"
	line "@"
	text_end

_DoItText::
	text "Je kunt het,"
	line "@"
	text_end

_GetmText::
	text "Pak'm! @"
	text_end

_EnemysWeakText::
	text "Maak het af,"
	line "@"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text " @"
	text_end

_EnoughText::
	text "genoeg!@"
	text_end

_OKExclamationText::
	text "OK!@"
	text_end

_GoodText::
	text "goed!@"
	text_end

_ComeBackText::
	text_start
	line "Kom terug!"
	done

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> verzamelt"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_ClearSaveDataText::
	text "Alle opgeslagen"
	line "data wissen?"
	done

_WhichFloorText::
	text "Kies een"
	line "verdieping:"
	done

_SleepingPikachuText1::
	text "Er wordt niet"
	line "gereageerd..."
	prompt

_PartyMenuNormalText::
	text "Kies een #MON."
	done

_PartyMenuItemUseText::
	text "Welke #MON wil"
	line "je dit geven?"
	done

_PartyMenuBattleText::
	text "Welke #MON"
	line "kies je?"
	done

_PartyMenuUseTMText::
	text "Wie wil je dit"
	line "leren?"
	done

_PartyMenuSwapMonText::
	text "Met wie moet de"
	line "#MON wisselen?"
	done

_PotionText::
	text_ram wcd6d
	text " kreeg"
	line "@"
	text_decimal wHPBarHPDifference, 2, 3
	text " HP!"
	done

_AntidoteText::
	text_ram wcd6d
	text " is"
	line "genezen van gif!"
	done

_ParlyzHealText::
	text_ram wcd6d
	text " is"
	line "niet meer verlamd"
	done

_BurnHealText::
	text "De brandwonden"
	line "zijn genezen!"
	done

_IceHealText::
	text_ram wcd6d
	text " is"
	line "ontdooid!"
	done

_AwakeningText::
	text_ram wcd6d
	text_start
	line "werd wakker!"
	done

_FullHealText::
	text_ram wcd6d
	text " is"
	line "helemaal gezond!"
	done

_ReviveText::
	text_ram wcd6d
	text_start
	line "komt bij zinnen"
	done

_RareCandyText::
	text_ram wcd6d
	text " steeg"
	line "naar L@"
	text_decimal wCurEnemyLVL, 1, 3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> zet de PC"
	line "aan."
	prompt

_AccessedBillsPCText::
	text "Verbonden met de"
	line "PC van BILL."

	para "#MON Opslag"
	line "Systeem geopend."
	prompt

_AccessedSomeonesPCText::
	text "Verbonden met"
	line "iemand zijn PC."

	para "#MON Opslag"
	line "Systeem geopend."
	prompt

_AccessedMyPCText::
	text "Verbonden met"
	line "mijn PC."

	para "Voorwerp Opslag"
	line "Systeem geopend."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> zet de PC"
	line "aan."
	prompt

_WhatDoYouWantText::
	text "Wat wil je doen?"
	done

_WhatToDepositText::
	text "Welk voorwerp wil"
	line "je opbergen?"
	done

_DepositHowManyText::
	text "Hoeveel?"
	done

_ItemWasStoredText::
	text_ram wcd6d
	text " is"
	line "opgeborgen."
	prompt

_NothingToDepositText::
	text "Je hebt niets om"
	line "op te bergen."
	prompt

_NoRoomToStoreText::
	text "Je opbergruimte"
	line "is vol!"
	prompt

_WhatToWithdrawText::
	text "Wat wil je graag"
	line "terugnemen?"
	done

_WithdrawHowManyText::
	text "Hoeveel?"
	done

_WithdrewItemText::
	text_ram wcd6d
	text_start
	line "teruggenomen."
	prompt

_NothingStoredText::
	text "Je hebt niets"
	line "opgeborgen."
	prompt

_CantCarryMoreText::
	text "Je kunt geen"
	line "extra voorwerpen"
	cont "dragen."
	prompt

_WhatToTossText::
	text "Wat wil je"
	line "weggooien?"
	done

_TossHowManyText::
	text "Hoeveel?"
	done

_AccessedHoFPCText::
	text "Accessed #MON"
	line "LEAGUE's site."

	para "Accessed the HALL"
	line "OF FAME List."
	prompt

_SleepingPikachuText2::
	text "There isn't any"
	line "response..."
	prompt

_SwitchOnText::
	text "Switch on!"
	prompt

_WhatText::
	text "What?"
	done

_DepositWhichMonText::
	text "Deposit which"
	line "#MON?"
	done

_MonWasStoredText::
	text_ram wStringBuffer
	text " was"
	line "stored in Box @"
	text_ram wBoxNumString
	text "."
	prompt

_CantDepositLastMonText::
	text "You can't deposit"
	line "the last #MON!"
	prompt

_BoxFullText::
	text "Oops! This Box is"
	line "full of #MON."
	prompt

_MonIsTakenOutText::
	text_ram wStringBuffer
	text " is"
	line "taken out."
	cont "Got @"
	text_ram wStringBuffer
	text "."
	prompt

_NoMonText::
	text "What? There are"
	line "no #MON here!"
	prompt

_CantTakeMonText::
	text "You can't take"
	line "any more #MON."

	para "Deposit #MON"
	line "first."
	prompt

_PikachuUnhappyText::
	text_ram wcd6d
	text " looks"
	line "unhappy about it!"
	prompt

_ReleaseWhichMonText::
	text "Release which"
	line "#MON?"
	done

_OnceReleasedText::
	text "Once released,"
	line "@"
	text_ram wStringBuffer
	text " is"
	cont "gone forever. OK?"
	done

_MonWasReleasedText::
	text_ram wStringBuffer
	text " was"
	line "released outside."
	cont "Bye @"
	text_ram wStringBuffer
	text "!"
	prompt

_RequireCoinCaseText::
	text "A COIN CASE is"
	line "required!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "We exchange your"
	line "coins for prizes."
	prompt

_WhichPrizeText::
	text "Which prize do"
	line "you want?"
	done

_HereYouGoText::
	text "Here you go!@"
	text_end

_SoYouWantPrizeText::
	text "So, you want"
	line "@"
	text_ram wcd6d
	text "?"
	done

_SorryNeedMoreCoinsText::
	text "Sorry, you need"
	line "more coins.@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Oops! You don't"
	line "have enough room.@"
	text_end

_OhFineThenText::
	text "Oh, fine then.@"
	text_end

_GetDexRatedText::
	text "Want to get your"
	line "#DEX rated?"
	done

_ClosedOaksPCText::
	text "Closed link to"
	line "PROF.OAK's PC.@"
	text_end

_AccessedOaksPCText::
	text "Accessed PROF."
	line "OAK's PC."

	para "Accessed #DEX"
	line "Rating System."
	prompt

_ExpressionText::
	text "This expression is"
	line "No. @"
	text_decimal wExpressionNumber, 1, 2
	text "."
	prompt

_NotEnoughMemoryText::
	text "Not enough Yellow"
	line "Version memory."
	done

_OakSpeechText1::
	text "Hoi! Welkom"
	line "in de wereld van"
	cont "#MON!"

	para "Mijn naam is OAK!"
	line "Ze noemen mij de"
	cont "#MON professor "
	prompt

_OakSpeechText2A::
	text "We delen deze"
	line "wereld met wezens"
	cont "die we #MON"
	cont "noemen!@"
	text_end

_OakSpeechText2B::
	text $51,"Voor sommigen zijn"
	line "ze huisdieren."

	para "Anderen spelen"
	line "wedstrijden met"
	cont "#MON."

	para "Wat ik met"
	line "#MON doe?"

	para "Het bestuderen van"
	line "#MON is mijn"
	cont "levenswerk."
	prompt

_IntroducePlayerText::
	text "Allereerst, wat is"
	line "je naam?"
	prompt

_IntroduceRivalText::
	text "Dit is mijn klein-"
	line "zoon. Hij is je"
	cont "rivaal, al sinds"
	cont "je klein was."

	para "...Euh, wat is"
	line "zijn naam ook"
	cont "alweer?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Je eigen #MON"
	line "verhaal gaat nu"
	cont "van start!"

	para "Een wereld vol met"
	line "hoop en avontuur"
	cont "samen met #MON"
	cont "wacht op je!"
	done

_DoYouWantToNicknameText::
	text "Wil je @"
	text_ram wcd6d
	line "een bijnaam"
	cont "geven?"
	done

_YourNameIsText::
	text "Oke! Dus je naam"
	line "is <PLAYER>!"
	prompt

_HisNameIsText::
	text "Oh ja, nu weet ik"
	line "het weer! Zijn"
	cont "naam is <RIVAL>!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " en"
	line "@"
	text_ram wcd6d
	text " zullen"
	cont "geruild worden."
	done

_Colosseum3MonsText::
	text "Je hebt 3 #MON"
	line "nodig!"
	prompt

_ColosseumMewText::
	text "Sorry, MEW mag"
	line "niet meedoen!"
	prompt

_ColosseumDifferentMonsText::
	text "Your #MON must"
	line "all be different!"
	prompt

_ColosseumMaxL55Text::
	text "No #MON can"
	line "exceed L55!"
	prompt

_ColosseumMinL50Text::
	text "All #MON must"
	line "be at least L50!"
	prompt

_ColosseumTotalL155Text::
	text "Your total levels"
	line "exceed 155!"
	prompt

_ColosseumMaxL30Text::
	text "No #MON can"
	line "exceed L30!"
	prompt

_ColosseumMinL25Text::
	text "All #MON must"
	line "be at least L25!"
	prompt

_ColosseumTotalL80Text::
	text "Your total levels"
	line "exceed 80!"
	prompt

_ColosseumMaxL20Text::
	text "No #MON can"
	line "exceed L20!"
	prompt

_ColosseumMinL15Text::
	text "All #MON must"
	line "be at least L15!"
	prompt

_ColosseumTotalL50Text::
	text "Your total levels"
	line "exceed 50!"
	prompt

_ColosseumHeightText::
	text_ram wcd6d
	text " is over"
	line "6’8” tall!"
	prompt

_ColosseumWeightText::
	text_ram wcd6d
	text " weighs"
	line "over 44 pounds!"
	prompt

_ColosseumEvolvedText::
	text_ram wcd6d
	text " is an"
	line "evolved #MON!"
	prompt

_ColosseumIneligibleText::
	text "Your opponent is"
	line "ineligible."
	prompt

_ColosseumWhereToText::
	text "Where would you"
	line "like to go?"
	done

_ColosseumPleaseWaitText::
	text "OK, please wait"
	line "just a moment."
	done

_ColosseumCanceledText::
	text "The link was"
	line "canceled."
	done

_ColosseumVersionText::
	text "The game versions"
	line "don't match."
	prompt

_TextIDErrorText::
	text_decimal hSpriteIndexOrTextID, 1, 2
	text " error."
	done

_ContCharText::
	text "<_CONT>@"
	text_end

_NoPokemonText::
	text "Er zijn hier"
	line "geen #MON!"
	prompt
