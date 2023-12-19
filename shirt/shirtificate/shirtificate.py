from fpdf import FPDF
class PDF():
    def __init__(self, name):
        self.pdf = FPDF(orientation="portrait", format="A4")
        self._pdf.set_font("helvetica", "B", 50)
        self._pdf.add_page()
        pdf.cell(text=""CS50 Shirtificate"", markdown=True)


pdf = PDF()
