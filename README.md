
# Requirements:
## 1. Create a sample Hello world c++ project and then create a docker file for this cmake/c++ project

- Manage unit tests with gtest [#Done] 
- Specify debug and release C/C++ flags using CMake and manage with a CMakeLists.txt  [#Done]
- Pump out logs and statistics generated by gcovr/lcov.

Those relevant files can be identified and pumped out [Also in Docker container we can use Bind Mount to mount a volume and redirect all identified files there]

find . -type f \( -iname *.gcno -o -iname *.gcda -o -iname *.gcov -o -iname coverage.info \) -exec mv {} "/tmp/" \;

[Code coverage using gcov from the gcc test suite, I haven't used the flags (-ftest-coverage -fprofile-arcs) during compilation, so in my build app there is no such logs]

 

## 2. Create a CI/CD pipeline to build the docker file from step 1

- Pipeline should have a logic to create release notes from list of Git merge on Master branch. [#Done]
- If the unit test cases are successful, publish the image to dockerhub  [#Done]
- Have a strategy for tagging and branching enabled in the pipeline (Good to have/Optional) [#Done for Tagging, branching strategy can be defined also]


# Usage of this CI/CD pipeline:
- Go to the 'Actions' tab.
- Select the 'Build Test and Artifact' workflow.
- Select 'Run workflow' on the right side.
- Select 'release' as perform_action.
- Finally, press 'Run workflow'.

![image](https://github.com/MdAbbasAli-batf/kone-assignment-demo/assets/24863141/81519395-5c04-4a90-b350-e9c44e4fc670)


The pipeline has 2 jobs: [selecting 'release' will trigger both jobs]

1. build:

This build job will Build my Simple helloworld C++ app, do the Unit Test using GTest, if test successful then it will create a Docker Image with a TAG and push it to my Docker Hub public repository.

https://hub.docker.com/r/mdabbasali/kone-assignment-dockerrepo/tags

2. release:

This release job will Create Release notes from the list of Git merges on Master branch. Then it will create a new release and also will TAG the source code with the same TAG as Docker Image. In the Release Asset section, it will show the Docker Image pull link with the correct TAG.
![image](https://github.com/MdAbbasAli-batf/kone-assignment-demo/assets/24863141/91881655-fe09-4fca-87f8-fc4392ed35ac)
