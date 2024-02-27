_IsEvolvingText::
	text "Wat? @"
	text_ram wStringBuffer
	text_start
	line "evolueert!"
	done

_FellAsleepText::
	text "<TARGET> is"
	line "gaan slapen!"
	prompt

_AlreadyAsleepText::
	text "<TARGET>"
	line "slaapt al!"
	prompt

_PoisonedText::
	text "<TARGET>"
	line "is vergiftigd!"
	prompt

_BadlyPoisonedText::
	text "<TARGET> is"
	line "erg vergiftigd!"
	prompt

_BurnedText::
	text "<TARGET>"
	line "is verbrand!"
	prompt

_FrozenText::
	text "<TARGET>"
	line "is een ijsblokje!"
	prompt

_FireDefrostedText::
	text "<TARGET>"
	line "is ontdooid!"
	prompt

_MonsStatsRoseText::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer
	text "@ is"
	text_end

_GreatlyRoseText::
	text "<SCROLL>flink@"
	text_end

_RoseText::
	text " gestegen!"
	prompt

_MonsStatsFellText::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer
	text "@ is"
	text_end

_GreatlyFellText::
	text "<SCROLL>flink@"
	text_end

_FellText::
	text " gezakt!"
	prompt

_RanFromBattleText::
	text "<USER>"
	line "is gevlucht!"
	prompt

_RanAwayScaredText::
	text "<TARGET>"
	line "is weggerend!"
	prompt

_WasBlownAwayText::
	text "<TARGET>"
	line "waait weg!"
	prompt

_ChargeMoveEffectText::
	text "<USER>@"
	text_end

_MadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	line "maakt wervelwind!"
	prompt

_TookInSunlightText::
	text_start
	line "baadt in de zon!"
	prompt

_LoweredItsHeadText::
	text_start
	line "bukt!"
	prompt

_SkyAttackGlowingText::
	text_start
	line "straalt!"
	prompt

_FlewUpHighText::
	text_start
	line "vliegt omhoog!"
	prompt

_DugAHoleText::
	text_start
	line "graaft een gat!"
	prompt

_BecameConfusedText::
	text "<TARGET>"
	line "is verward!"
	prompt

_MimicLearnedMoveText::
	text "<USER>"
	line "leerde"
	cont "@"
	text_ram wcd6d
	text "!"
	prompt

_MoveWasDisabledText::
	text "<TARGET>'s"
	line "@"
	text_ram wcd6d
	text " was"
	cont "disabled!"
	prompt

_NothingHappenedText::
	text "Nothing happened!"
	prompt

_NoEffectText::
	text "No effect!"
	prompt

_ButItFailedText::
	text "But, it failed! "
	prompt

_DidntAffectText::
	text "It didn't affect"
	line "<TARGET>!"
	prompt

_IsUnaffectedText::
	text "<TARGET>"
	line "is unaffected!"
	prompt

_ParalyzedMayNotAttackText::
	text "<TARGET>'s"
	line "paralyzed! It may"
	cont "not attack!"
	prompt

_SubstituteText::
	text "It created a"
	line "SUBSTITUTE!"
	prompt

_HasSubstituteText::
	text "<USER>"
	line "has a SUBSTITUTE!"
	prompt

_TooWeakSubstituteText::
	text "Too weak to make"
	line "a SUBSTITUTE!"
	prompt

_WasSeededText::
	text "<TARGET>"
	line "was seeded!"
	prompt

_EvadedAttackText::
	text "<TARGET>"
	line "evaded attack!"
	prompt

_HitWithRecoilText::
	text "<USER>'s"
	line "hit with recoil!"
	prompt

_ConvertedTypeText::
	text "Converted type to"
	line "<TARGET>'s!"
	prompt

_StatusChangesEliminatedText::
	text "All STATUS changes"
	line "are eliminated!"
	prompt

_GettingPumpedText::
	text "<USER>'s"
	line "getting pumped!"
	prompt

_StartedSleepingEffect::
	text "<USER>"
	line "started sleeping!"
	done

_FellAsleepBecameHealthyText::
	text "<USER>"
	line "fell asleep and"
	cont "became healthy!"
	done

_RegainedHealthText::
	text "<USER>"
	line "regained health!"
	prompt

_TransformedText::
	text "<USER>"
	line "transformed into"
	cont "@"
	text_ram wcd6d
	text "!"
	prompt

_LightScreenProtectedText::
	text "<USER>'s"
	line "protected against"
	cont "special attacks!"
	prompt

_ReflectGainedArmorText::
	text "<USER>"
	line "gained armor!"
	prompt

_ShroudedInMistText::
	text "<USER>'s"
	line "shrouded in mist!"
	prompt

_CoinsScatteredText::
	text "Coins scattered"
	line "everywhere!"
	prompt

_SuckedHealthText::
	text "Sucked health from"
	line "<TARGET>!"
	prompt

_DreamWasEatenText::
	text "<TARGET>'s"
	line "dream was eaten!"
	prompt

_TradeCenterOpponentText::
	text "!"
	done

_ColosseumOpponentText::
	text "!"
	done
