# analysis-of-NASA-meteorite-dataset
Analyzed NASA's dataset of 45,000+ meteorite landings, utilizing R and advanced libraries for insightful visualizations and geographical mapping

**Summary**: For the purpose of research and education, the Meteoritical Society has published their collection of all known meteorite landings recorded in human history. This is an analysis of this dataset containing data on over 45,000 meteorites that have fallen from outer space and struck earth. In this project, I focused on the analysis and visualization of a few variables, such as the year the meteorites were found or observed falling and the distribution of the mass of the meteorites, looking at varying sample sizes drawn from the population. I also looked at the geographical distribution of the meteorite landings, as well as the geospatial mapping of observed meteorite landings versus found meteorites, among other things.

**Analysis**:

The first analysis I did was for a numeric variable, the masses of the meteorites. Since the values in the population for the mass were extremely variant, I decided to take the log of the masses instead of the actual masses to better visualize the distribution of the population masses.
<img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/8d546217-1c89-44ae-b872-cd5e9a267fcb">

I then drew a few samples from the population using simple random sampling without replacement with sample sets of various sizes and plotted the distribution of these sample sets using a plotly histogram. I compared these sample distributions to the distribution of the entire population and found that, in accordance with the Central Limit Theorem, as the sample sizes increase, the distribution increasingly approaches normal distribution and looks more similar to the population distribution.

<img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/71d91e7c-57a4-41fc-a5f7-c1a8e1a2377f"> <img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/d60b50f4-0b1f-4836-93a6-635196c40249">
<img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/79fbb672-96b4-4a02-bbb7-a9bad8387482"> <img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/799caa9c-28d1-4b3c-9a11-078effc6c877">

Next, I plotted histograms of all meteorite landings grouped by year and then by decade to see if there were any interesting trends for this variable.

<img width="229" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/b24ff122-d3eb-4160-97c4-d98871e85b95"> <img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/b9bea029-934f-467d-82b3-37aee9b467e3"> 

I then separated the histograms and looked at the historical distribution of meteorites that were observed falling and meteorites that were found. I also attempted to combine these two histograms to create a stacked histogram to visualize the historical distribution of observed meteorites versus meteorites that were found but the volume of meteorites that were found greatly exceeded the number of meteorites that were actually observed falling so this made it difficult to visualize a comparison between the two.

<img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/380dba3c-e7b2-47d9-ac52-e12ad9846345"> <img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/0233f966-885a-4d66-a768-b81bc77d38fd">
<img width="350" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/afc87eaf-9f1b-46f8-b2fe-e07bc8169291"> <img width="205" alt="Screen Shot 2023-08-08 at 3 56 02 PM" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/84d56632-0fa1-42b8-b608-7694234351d4">

Unsurprisingly, the total number of meteorite landings has increased as time has gone on. This can be attributed to a number of factors, most notably the advancement of technology and means of communication and data collection, as well as an increase in global population density. The distribution of observed meteorites has been relatively spread out throughout the past century, with a notable increase in 1939/1940, which can be attributed to the 1939-1940 Giacobinid meteor shower, the strongest meteor shower in the century.

The second half of my project focused on geographical distributions and visualizing geospatial maps primarily using ggplot2, as well as a few other packages. I first mapped out the geographical distribution of all meteorite landings.
 ![image](https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/15564f1a-255b-4b57-a1fb-dd39cb1bc568)
I again separated this based on the value of the variable “fell,” looking at the geographical distribution of observed meteorite landings versus meteorites found. I was able to plot these variables on the same world map, blue points representing found meteorites and pink points representing observed meteorite landings.
<img width="468" alt="image" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/bfadd8bf-70b7-475a-a089-9ed71a6acdb2"> <img width="103" alt="Screen Shot 2023-08-08 at 3 58 43 PM" src="https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/8e73fcac-682a-4786-8755-71804cacdded">

It appears as though the vast majority of meteorites have been found or observed falling in the central United States, spread out throughout Europe, the northern African coast, India, the southern Australian coast, and Japan. This can be attributed to a plethora of different factors. One reason that we see many of the pink points in the places where we do, i.e. India, Europe, the east coast of the United States could be due to higher population sizes where more people would be likely to see and report a meteorite falling. One possible explanation for why we see an extraordinary number of blue points in the central United States is that there is a lot of lot with decent population size, including plains and farmland, so if there are organizations established to search for fragments of meteorites in these regions, there would probably be a higher likelihood of finding them. In addition, it may be a fair assumption to state that a vast majority of meteorites may have struck the earth in its oceanic regions and have never been discovered.


The final geographical distribution I mapped out was the global distribution of the meteorites as a function of mass.
 ![image](https://github.com/divya-kapur/analysis-of-NASA-meteorite-dataset/assets/47482776/84009259-e3b9-4e31-8ca2-abfcae6607dc)
As the points get larger and closer to red on the gradient scale, the larger the meteorite. Although there are a few notable large impacts, the majority of the meteorites were probably small fragments whose parent rocks were degraded as they were hurtling through the atmosphere.












