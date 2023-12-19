from fpdf import FPDF
class PDF():
    def __init__(self, name):
        self._pdf = FPDF(orientation="portrait", format="A4")
        self._pdf.add_page()
        self._pdf.set_font("helvetica", "B", 50)
        self._pdf.cell(text="CS50 Shirtificate", center = True, markdown=True, new_x = "LMARGIN", new_y = "NEXT")


    def save(self, name):
        self._pdf.output(name)

    def image(self, path):
        self._pdf.image(path, w = self._pdf.epw)
        self._pdf.set_text_color(255, 255, 255)
        self._pdf.set_font("helvetica", "B", 25)
        self._pdf.text(text="Burak Sener took CS50", x = 50, y = 100)



pdf = PDF("cs50")
pdf.image("./shirtificate.png")
pdf.save("Shirtificate.pdf")
