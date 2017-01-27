from PyPDF2 import PdfFileWriter, PdfFileReader
import sys

watermarkPDF = sys.argv[1]
inputPDF = sys.argv[2]
outputPDF = sys.argv[3]

output = PdfFileWriter()

ipdf = PdfFileReader(open('file.pdf', 'rb'))
wpdf = PdfFileReader(open('PDFbackground.pdf', 'rb'))
watermark = wpdf.getPage(0)

for i in range(ipdf.getNumPages()):
    page = ipdf.getPage(i)
    page.mergePage(watermark)
    output.addPage(page)

with open(outputPDF, 'wb') as f:
   output.write(f)