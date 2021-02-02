%Example script to implement the Proposed Baybayin OCR System
%--------------------------------------------------------------------------
%We need to load first the Baybayin and Latin character classifiers in the workspace
%load('Baybayin_Character_Classifier_00379.mat')
%load('Latin_Character_Classifier_00330.mat')

Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, 'A.png');

%You can also try for other sample images provided.

%Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, 'E.png');
%Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, 'Gegi.png');
%Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, 'Koku.png');
%Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, 'R.png');