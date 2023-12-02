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
        day = day.split(",")
        for _ in months:
            if _ == month:
                month = _ + 1
        

    print(f"{year:0004}-{month:02}-{day:02}")


