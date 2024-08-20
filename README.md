# MyReciPy

![homepage](/assets/homepage.jpeg?raw=true "ReciPy Homepage")

A recipe-based search engine that provides convenience to use your ingredients available, discover new recipe variations, and filter for preferences with ease.

## System Overview
As college students, eating healthy foods can seem like a chore given high-stress environments and tight deadline-driven culture. The objective of this application is to appeal to anyone seeking to meal prep with their available ingredients. By creating a meal prep application, this will not only lower the overhead of meal-prepping intricacies but will save time and preserve our overall health. By providing an ingredient-based hub for meal prepping, with the fulcrum being convenience, we seek to gain traction by appealing to a user-base that favors simplicity and benefits from user-friendly healthy recipes.

## Repo Structure
- `assets/`: contains crawler architecture, sample output and performance metrics
- `crawlers/`: contains all python crawlers separated by source
- `data/`: contains scraped data from each traversed source
- `indexer/`: contains all indexing related information such as:
    - JSON file containing all recipes scraped
    - indexing class file
- `scripts/`: contains all executable scripts for ease of use and access
    - `crawl.sh`: executable script that runs all crawlers in paArallel given necessary parameters
    - `help.sh`: help with flags that can be used
    - `index.sh` -f [filename] -d [directory] -t [testing] -q [query on] -c [results count] -m [sample size for testing]
- `tools/`: contains scripts for schema validation
    - `aggregator.py`: combines all recipes into a singular JSON file
    - `validator.py`: validates parent global schema against specified current schema

## Technology Used
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Python, Flask
- **Database:** MongoDB
- **Web-Scraping Library:** BeautifulSoup

## Setup & Installation

### Setup local environment
```bash
# Install JDK
wget https://download.oracle.com/java/17/archive/jdk-17.0.10_macos-aarch64_bin.dmg

# Install Ant
brew install ant
which ant # /opt/homebrew/bin/ant

# Install PyLucene
wget http://apache.claz.org/lucene/pylucene/pylucene-9.4.1-src.tar.gz
tar zxvf pylucene-9.4.1-src.tar.gz

# Install JCC
cd ~/Downloads/pylucene-9.4.1
cd jcc
python3 setup.py build
sudo python3 setup.py install

# Compile PyLucene
cd .. # back one step from jcc dir
cd pylucene-9.4.1

## Modify Makefile
PREFIX_PYTHON=/usr/local
ANT=/opt/homebrew/bin/ant
PYTHON=$(PREFIX_PYTHON)/bin/python3
JCC=$(PYTHON) -m jcc --shared --arch arm64
NUM_FILES=8

## Run `make`
make
sudo make test
sudo make install
# Note that this may take a while, so don't worry

## Verify execution
python3 -c "import lucene; lucene.initVM()"
```

### Setup virtual environment
```bash
python3 -m venv path/to/venv
source path/to/venv/bin/activate
python3 -m pip install bs4 # add packages as needed
```

### Clone our repo
```bash
git clone https://github.com/devbydan/MyReciPy.git
cd MyReciPy
pip install -r requirements.txt
```

## How do I setup MongoDB?
```bash
brew tap mongodb/brew
brew update
brew install mongodb-community@7.0
mongod --port 27017 # default port used in MongoDB Compass
```

## How can I run MongoDB?
```bash
brew services start mongodb-community@7.0 # Start MongoDB services
brew services stop mongodb-community@7.0  # Stop MongoDB services
```

### How do I crawl?
```bash
cd scripts        # navigate into scripts directory
chmod +x crawl.sh # grant exe permissions
./crawl.sh        # invoke crawler
```

### How do I index?
```bash
cd scripts             # navigate into scripts directory
chmod +x /scripts/*.sh # grant exe permissions
./index.sh             # invoke crawler
```
Note that it is **optional** to run the ```help.sh``` script to show flag options

### How do I index with an interface?
```bash
# Execute the script
cd scripts # navigate into scripts directory
./run.sh   # run flask app

# OR...

# Run the process manually
export FLASK_APP=index
flask run -h 0.0.0.0 -p 8888
```
