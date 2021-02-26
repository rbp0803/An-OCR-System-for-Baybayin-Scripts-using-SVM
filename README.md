# An-OCR-System-for-Baybayin-Scripts-using-SVM
A proposed algorithm to recognize Baybayin writing system using support vector machine. You can check the full paper here: https://peerj.com/articles/cs-360/.

<b> NOTE: The complete system files (generated SVM models, example images, etc.) described here can be downloaded in Release section. Its source filename is `An.OCR.System.for.Baybayin.Scripts.using.SVM.zip`. The following link provides the compressed system file page:
  
https://github.com/rbp0803/An-OCR-System-for-Baybayin-Scripts-using-SVM/releases/tag/v1.0.2.
</b>

The following codes and variables are produced entirely in MATLAB whose functions or uses are describe below:

## Variables

```
Multi-SVM classifiers
• Latin_Character_Classifier_00330.mat - for classification of Latin characters
• Baybayin_Character_Classifier_00379.mat - for classification of Baybayin Characters
```
```
Binary classifiers for script categorization and Baybayin diacritic classification
• LvsB_classifier_00125.mat
• Subscript_Classifier_00000.mat
• Superscript_Classifier_00000.mat
```

```
Binary classifiers which will be used for reclassification of confusive Baybayin characters
• AVSMa_00225.mat
• KaVSEI_00100.mat
• HaVSSa_00050.mat
• LaVSTa_00100.mat
• PaVSYa_00550.mat
(Note: smile.mat does not have any function. It is just there to uphold the sequence of the confuselist.) 
```
## Function Codes/Scripts
###### The main OCR System
```
• Proposed_Baybayin_OCR.m - the main system is coded here and has subfunctions that supports the recognition algorithm. 
• Baybayin_letter_revised_segueway.m - this is a subfunction from the Proposed OCR Algorithm for classifying one component 
                                       Baybayin characters.
• Latin_Letter_guesser.m - this is a subfunction from the Proposed OCR Algorithm for classifying  Latin characters.
• seg.m - this is a subfunction from the Proposed OCR Algorithm for classifying Baybayin characters with diacritics.
• seg2.m - this is a subfunction from the Proposed OCR Algorithm and intentionally made to recognize the Baybayin character 'E/I'. 
           Otherwise, the algorithm is assigned to find if the other components are part of the main body or simply its accent
• kmeans_mod.m - this is a subfunction from the Proposed OCR Algorithm for clustering a grayscaled image into 2 intensities 
                 intended for image binarization
• c2bw.m - this is a subfunction from the Proposed OCR Algorithm for converting the input raw image into binary image using the 
           modified kmeans function.
• feature_vector_extractor.m - this is a subfunction from the Proposed OCR Algorithm that outputs the 1x3136 feature vector array 
                               of the input square matrix.
```           
###### SVM model generators
```
• data_training_testing2_revised2.m - this function generates binary SVM models for Script classification, Baybayin diacritics 
                                      categorization, and binary classifiers for confusive Baybayin characters. 
• data_traintest3_multiclass_17classes_v2_revised.m - this function generates multiclass SVM models in classifying 17 
                                                      Baybayin characters.
• data_traintest3_multiclass_26classes_v2_revised_latin.m - this function generates multiclass SVM models in classifying 26 
                                                            Latin characters.
```
### Sample Run
`Example_run.m` contains an example script to execute the proposed algorithm.
