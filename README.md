![DockerML](https://user-images.githubusercontent.com/55043035/119315145-2b716c00-bc93-11eb-9285-ad354dd1945a.png)
# DockerML
DockerML is a turnkey solution that lets you configure your Machine Learning environment in a few simple steps, No dependancy issues, no interference with system libraries, easy portability and most of all no headaches. With DockerML you should be able to be up and running with a ML environment in minutes instead of hours.  

DockerML comes pre-installed with the following libraries
|Frameworks|Version|Source|
|----------|-------|------|
|catalyst|latest|PyPi|
|einops|latest|PyPi|
|jax|latest|PyPi|
|jaxlib|latest|PyPi|
|jupyterlab|latest|PyPi|
|matplotlib|latest|PyPi|
|numba|latest|PyPi|
|numpy|latest|PyPi|
|onnx|latest|PyPi|
|optuna|latest|PyPi|
|opencv-python||Source|
|pandas|latest|PyPi|
|ray|latest|PyPi|
|scikit-learn|latest|PyPi|
|sympy|latest|PyPi|
|tensorflow|latest|PyPi|
|torch|latest|PyPi|
|torchvision|latest|PyPi|
|tqdm|latest|PyPi|
|transformers|latest|PyPi|
|vowpalwabbit|latest|PyPi|
|wandb|latest|PyPi|
|xgboost|latest|PyPi|

# Directory Structure
```
dockerml
├── LICENSE
├── README.md
├── dockerml-cpu.Dockerfile
├── dockerml-gpu.Dockerfile
├── docs
│   ├── _config.yml
│   └── index.md
└── requirements.txt
```

# Running the container
to use DockerML
1. Clone this repository `git clone https://github.com/SupreethRao99/DockerML.git`
2. Change directories to the DockerML directory `cd DockerML`
3. To build the docker image run `docker build -f dockerml-cpu.Dockerfile -t supreethrao/docker-ml  .`
4. To run the image , execute `docker run -it -p 8888:8888 supreethrao/dockerml-cpu `
  - a directory on the docker host can be attached to the container using the `-v` flag. `docker run -it -p 8888:8888 -v /path/to/local/folder:/usr/src/app supreethrao/dockerml-cpu` . To know more about attaching volumes , [Docker volumes documentation](https://docs.docker.com/storage/volumes/)
6. Once the container is running , inside the command line of the container run `jupyter notebook --ip 0.0.0.0 --no-browser --allow-root`
7. Go to (http://localhost:8888/tree) or the url produced as the output when the above command was run (preffered)


# Citation
```
@misc{DockerML,
    author = {Supreeth Rao},
    title = {DockerML : Turnkey setup of Jupyter Notebooks for AI/ML},
    year = {2021},
    publisher = {GitHub},
    journal = {GitHub repository},
    howpublished = {\url{https://github.com/SupreethRao99/DockerML}}
}
```
# Contributing
Feel free to make pull requests to fix bugs or add features

# License
DockerML is licensed under the [MIT License](https://github.com/SupreethRao99/DockerML/blob/main/LICENSE)
