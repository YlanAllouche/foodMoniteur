# Goal

Monitors Calorie Intake and Macronutrients Ratios in R using Flexdashboard and Plumber in R.

The Plumber worker listens to the `param` argument to read and wrangle the associated `.xlsx` file.
A flexdashboard HTML file is returned.

I advise to run this in a container.
A docker-compose yml document is available as an example.

![](ss1.png)
![](ss2.png)

# Deployment

To run from the public Docker registry:

* `cd some_folder_containeing your data
* `docker run -it --rm -p 80:80 -v $(pwd):/data ylanallouche/foodmoniteur`
* Browse: `http://localhost:81/dashboard?param=some_user`

# IDE

Simply run `./run-ide.sh` to start a containerized IDE in your bwoser on a random port using your current user's UID.
