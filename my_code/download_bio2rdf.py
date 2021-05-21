from selenium import webdriver
import time

site = 'https://download.bio2rdf.org/#/'
then_1 = 'release'
then_2 = '4'
folder = 'refseq'

options = webdriver.ChromeOptions()
prefs = {"download.default_directory" : "E:\\Tráchtas\\downloading\\" + folder + "\\"}
options.add_experimental_option("prefs", prefs)
options.binary_location = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
driver = webdriver.Chrome(chrome_options=options, executable_path="C:\\Program Files\\Google\\Chrome\\Application\\chromedriver.exe")

#Get to the data folder
driver.get(site)
driver.find_element_by_link_text('release').click()
driver.implicitly_wait(10)
driver.find_element_by_link_text('4').click()
driver.implicitly_wait(10)
driver.find_element_by_link_text(folder).click()

#Get all files in the data folder
time.sleep(3)
links = driver.find_elements_by_tag_name('a')
to_download = [link for link in links if '.nq' in link.text]
num_groups = 10
grúpaí = [to_download[i:i+num_groups] for i in range(0, len(to_download), num_groups)]
for grúpa in grúpaí:
    for réad in grúpa:
        réad.click()
    time.sleep(180) #3 nóiméad chun gach grúpa a íoslódáil

#driver.quit()
exit(0)
