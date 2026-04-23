import requests
from bs4 import BeautifulSoup

URL = "https://realpython.github.io/fake-jobs/"

response = requests.get(URL, timeout=30)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

job_cards = soup.find_all("div", class_="card")

print("Jobs found:", len(job_cards))

jobs = []

for card in job_cards:
    title_tag = card.find("h2", class_="title")
    company_tag = card.find("h3", class_="company")
    location_tag = card.find("p", class_="location")

    if title_tag and company_tag and location_tag:
        jobs.append(
            {
                "title": title_tag.get_text(strip=True),
                "company": company_tag.get_text(strip=True),
                "location": location_tag.get_text(strip=True),
            }
        )

for job in jobs[:5]:
    print(job)

import pandas as pd 

df = pd.DataFrame(jobs)

print(df.head())

df.to_csv("projects/web_scraping_analysis/data/jobs.csv", index=False)

print("Data saved to jobs.csv")