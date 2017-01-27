from PyPDF2 import PdfFileWriter, PdfFileReader
import os
import sys

output = sys.argv[1]
merger = PdfFileMerger()
files = [x for x in os.listdir('file/path') if x.endswith('.pdf')]
for fname in sorted(files):
    merger.append(PdfFileReader(open(os.path.join('file/path', fname), 'rb')))

merger.write(output)