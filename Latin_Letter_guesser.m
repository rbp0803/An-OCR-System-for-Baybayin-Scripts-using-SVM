% =====================================================================%
%Note:                                                                 %
%This is a subfunction from the Proposed OCR Algorithm for classifying %
%Latin characters                                                      %  
% ---------------------------------------------------------------------%



%MDL= SVM Model for Latin characters (56x56)   MAT Filename: Latin_Character_Classifier_00330
%input= Latin character 1x3136 feature vector
function [P, Posterior]=Latin_Letter_guesser(MDL, input)

[~, ~, ~, Posterior]=predict(MDL,input);
[P, LABEL1]=max(Posterior);



if LABEL1==1
    fprintf('Character A.\n\n');
    
elseif LABEL1==2
    fprintf('Character B.\n\n');
    
elseif LABEL1==3
    fprintf('Character C.\n\n');
    
elseif LABEL1==4
    fprintf('Character D.\n\n');

elseif LABEL1==5
    fprintf('Character E.\n\n');

elseif LABEL1==6
    fprintf('Character F.\n\n');
 
elseif LABEL1==7
    fprintf('Character G.\n\n');
    
elseif LABEL1==8
    fprintf('Character H.\n\n');
    
elseif LABEL1==9
    fprintf('Character I.\n\n');
    
elseif LABEL1==10
    fprintf('Character J.\n\n');
    
elseif LABEL1==11
    fprintf('Character K.\n\n');
    
elseif LABEL1==12
    fprintf('Character L.\n\n');
    
elseif LABEL1==13
    fprintf('Character M.\n\n');
  
elseif LABEL1==14
    fprintf('Character N.\n\n');
    
elseif LABEL1==15
    fprintf('Character O.\n\n');
    
elseif LABEL1==16
    fprintf('Character P.\n\n');
    
elseif LABEL1==17
    fprintf('Character Q.\n\n');
    
elseif LABEL1==18
    fprintf('Character R.\n\n');
    
elseif LABEL1==19
    fprintf('Character S.\n\n');
    
elseif LABEL1==20
    fprintf('Character T.\n\n');
    
elseif LABEL1==21
    fprintf('Character U.\n\n');
    
elseif LABEL1==22
    fprintf('Character V.\n\n');
    
elseif LABEL1==23
    fprintf('Character W.\n\n');
    
elseif LABEL1==24
    fprintf('Character X.\n\n');

elseif LABEL1==25
    fprintf('Character Y.\n\n');
    
elseif LABEL1==26
    fprintf('Character Z.\n\n');
    
end
end

    
    
    
    
    
    
    
    
    
    
    