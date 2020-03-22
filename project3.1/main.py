import requests
from bs4 import BeautifulSoup

# Get page contents for song lyrics and then make soup
page = requests.get('https://www.jiosaavn.com/lyrics/no-sugar-coated-love-lyrics/M1s8ZCR0BHI')
soup = BeautifulSoup(page.text, 'html.parser')

#use soup to find the p tag with the class 'lyrics'
lyrics = soup.find("p", class_="lyrics")

#add a new line to each br as this website uses that for new lyric lines
for elem in lyrics.find_all("br"):
    elem.append('\n')

#print out the final parsed lyrics
print(lyrics.get_text(strip=False, separator=""))