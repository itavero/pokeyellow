TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bird
	dw .Bug
	dw .Ghost

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	assert_table_length NUM_TYPES

.Normal:   db "NORMAAL@"
.Fighting: db "GEVECHT@"
.Flying:   db "VLIEGEND@"
.Poison:   db "GIF@"
.Fire:     db "VUUR@"
.Water:    db "WATER@"
.Grass:    db "GRAS@"
.Electric: db "ELECTR@"
.Psychic:  db "PSYCH@"
.Ice:      db "IJS@"
.Ground:   db "GROND@"
.Rock:     db "STEEN@"
.Bird:     db "VOGEL@"
.Bug:      db "INSECT@"
.Ghost:    db "GEEST@"
.Dragon:   db "DRAAK@"
