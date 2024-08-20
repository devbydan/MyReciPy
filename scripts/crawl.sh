cd ../crawlers/  # navigate to crawler directory

echo "Starting all crawlers, in parallel (Crtl-C will stop all)..."
trap 'kill 0' SIGINT; python3 allRecipesCrawler.py & python3 foodComCrawler.py & python3 foodNetworkCrawler.py & python3 recipeTinEatsCrawler.py & python3 simplyRecipesCrawler.py & wait

#echo "Starting AllRecipes Crawler"
#python AllRecipesCrawler.py
#
#echo "Starting Food.com Crawler"
#python foodComCrawler.py
#
#echo "Starting Food Network Crawler"
#python FoodNetworkCrawler.py
#
#echo "Starting Recipe TinEats Crawler"
#python RecipeTinEats.py
#
#echo "Starting Simply Recipes Crawler"
#python SimplyRecipesCrawler.py