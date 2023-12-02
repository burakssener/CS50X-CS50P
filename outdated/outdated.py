months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]
while True:
    raw_date = input("Date: ").strip()
    try:
        month, day, year = raw_date.split("/")
    except ValueError:
        month, day, year = raw_date.split(" ")
        day = day.replace(",", "")
        month = month.lower().title()
        for _ in range(len(months)):
            if months[_] == month:
                month = _ + 1
            else:
                continue
    day, year = int(day), int(year)
    print(f"{year:04}-{month:02}-{day:02}")
    break


