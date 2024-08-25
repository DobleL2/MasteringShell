#!/bin/bash
# Bulk File Renaming Script

DATE=$(date +%Y%m%d)
for FILE in *.txt; do
	mv "$FILE" "${FILE%.txt}_$DATE.txt"
done

echo "Renaming of .txt files completed"
