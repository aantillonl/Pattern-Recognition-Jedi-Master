#Pattern recognition class project
This is a project developed for the pattern recognition class in Lappeenranta University of Technology
The goal of the project is to classify swordfight moves collected with a remote control equiped with
accelerometers on three axis.

The system should classify moves as one of the following 7 moves:
-Slash left
-Slash right
-Cross strike
-Parry & strike
-Parry up
-Overhead strike
-Stab

##Data
The data used for design and training was collected using a wii remote controller. 8 people provided multiple
demonstrations of all 7 movements, a total of 226 samples were used for training.

The features extracted from this data were mostly statistical features, such as mean and standard deviation.
Also the acceleration signal was integrated to obtain velocity and displacement.

##Software
The software used to implement the solution is Matlab, all data are saved as .mat files,
the scripts and funcitons are .m files as well.

##The classifier
A knn classifier was the choice to implement the solution, due to the simplicity and effectiveness for this
type of application

##Results
The classifier was trained with a total of 226 samples, from 8 people who provided demonstrations for all 7 moves
and tested by the professor with 100 new samples that are not available for students. The classifier performed 
with an accuracy of 77%, and classified the 100 samples in less than a second.

##Authors
The project was developed in a team along with Karri V‰‰n‰nen (github: arpin).