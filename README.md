# UN-Clustering

Database: World Bank World Development Indicators (WDI) 2016


Objectives:
--------
Cluster countries according to their GDP per Capita and Worker Fatality rate (1), and GNI per Capita and College Enrolment (2).


Clustering Methodology:
--------
Hierarchical clustering was selected and number of clusters determined by domain-specific considerations (economics) for (1) 
and R package nbclust tests for (2).

Our similarity measure was the euclidean distance (required by the method) and the method used was Ward's method. Ward's was chosen
to serve the goal of minimizing intra-cluster variance (to emphasize similarities between countries) but allowing for different sized clusters.
Ward was chosen since single linkage is sensitive to forming long "chains" and complete linkage is sensitive to outliers (here it outlier
was "Qatar"). We included "Qatar" to aid in qualitative cross-validation by domain experts. 

We chose to scale the data to [0, 1] and left alone the distribution (mean, variance) since we could not assume we had a representative 
sample. We were able to obtain only 61 data points for (1) and 34 data points for (2) since there was missing data in WDI. Total country 
count is ~200. In (1), the square root of GDP data was taken to emphasize the difference of the gulf states from other regions.
Scaling to [0,1] gave equal influence to both indicators for the clustering algorithm.


Cluster Evaluations:
--------
(1) The gulf states (with Israel, and Brunei), colored green, with high fatality rates for their GDP class (middle-high income) were successfully clustered together. Low-income, high fatality rate (red) and high-income, low fatality rate (blue) countries were also successfully clustered. The countries that appeared in each of the aforementioned groups match the expectations based on their socioeconomic situations.

Not so successful was the black cluster that included a wide range of countries from first world highly developed countries (Japan, R. of Korea, and Spain) to emerging economies (China, India). Additionally, Qatar with its abnormally high fatality rate compared to its high income was considered an outlier. Other transformations of the data may yield better results.

(2) The optimal number of clusters was determined by the nbclust suite of tests (see nbclust documentation for details). In this case it was 3. The clustering makes sense, with groups corresponding to high income (blue), middle income (green), and low to mid-low income (red) countries. In this case there was a clear visual distinction between clusters.


Data Notes:
-------
While conducting investigations for (2), data point "Macao SAR, China" was a clear outlier and was removed from further investigations. 
Data less than 10 years old was deemed admissible by domain experts hence data points are data from 2006 or later.


-------
Work done for the United Nations Economic and Social Commission for Asia-Pacific (UN ESCAP) in Bangkok, Thailand
