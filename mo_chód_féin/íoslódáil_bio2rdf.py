from selenium import webdriver
import time

suíomh = 'https://download.bio2rdf.org/#/'
ansin_1 = 'release'
ansin_2 = '4'
fillteán = 'refseq'

options = webdriver.ChromeOptions()
prefs = {"download.default_directory" : "E:\\Tráchtas\\ag_íoslódáil\\" + fillteán + "\\"}
options.add_experimental_option("prefs", prefs)
options.binary_location = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
driver = webdriver.Chrome(chrome_options=options, executable_path="C:\\Program Files\\Google\\Chrome\\Application\\chromedriver.exe")

#Get to the data folder
driver.get(suíomh)
driver.find_element_by_link_text('release').click()
driver.implicitly_wait(10)
driver.find_element_by_link_text('4').click()
driver.implicitly_wait(10)
driver.find_element_by_link_text(fillteán).click()

#Get all files in the data folder
time.sleep(3)
nascanna = driver.find_elements_by_tag_name('a')
chun_íoslódáil = [nasc for nasc in nascanna if '.nq' in nasc.text]
méid_grúpaí = 10
grúpaí = [chun_íoslódáil[i:i+méid_grúpaí] for i in range(0, len(chun_íoslódáil), méid_grúpaí)]
for grúpa in grúpaí:
    for réad in grúpa:
        réad.click()
    time.sleep(180) #3 nóiméad chun gach grúpa a íoslódáil

#driver.quit()
