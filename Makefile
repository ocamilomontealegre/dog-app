FLUTTER_CMD=flutter
DART=dart

.PHONY: web

web:
	${FLUTTER_CMD} run -d chrome

fix_preview:
	${DART} fix --dry-run

fix_apply:
	${DART} fix --apply

