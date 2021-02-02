% =====================================================================%
%Note:                                                                 %
%This is a subfunction from the Proposed OCR Algorithm for classifying %
%one component Baybayin characters                                     %  
% ---------------------------------------------------------------------%

%Mdl= SVM Model for recognizing baybayin script (56x56)
%input= 56x56 binarized Baybayin character 

function [P,Posterior]=Baybayin_letter_revised_segueway(Mdl,input)

%List of Binary classifiers which will be use for
%reclassification of confusive Baybayin characters
Confuselist={'AVSMa_00225.mat','KaVSEI_00100.mat','smile.mat',...
             'HaVSSA_00050.mat','LaVSTa_00100.mat','PaVSYa_00550.mat'};

%feature vector extraction         
Letter1=feature_vector_extractor(input);

%Default Baybayin character classification
[~,~,~,Posterior]=predict(Mdl,Letter1);
[P, Label1]=max(Posterior);

if Label1==1
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character A.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ma.\n\n');
    end
    
elseif Label1==2
    fprintf('It''s a Baybayin Script.\n Character Ba.\n\n');
    
elseif Label1==3
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Ka.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character E/I.\n\n');
    end
    
elseif Label1==4
    fprintf('It''s a Baybayin Script.\n Character Da.\n\n');
    
elseif Label1==5
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Ka.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character E/I.\n\n');
    end
    
elseif Label1==6
    fprintf('It''s a Baybayin Script.\n Character Ga.\n\n');
    
elseif Label1==7
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Ha.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Sa.\n\n');
    end
    
elseif Label1==8
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character La.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ta.\n\n');
    end
    
elseif Label1==9
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character A.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ma.\n\n');
    end
    
elseif Label1==10
    fprintf('It''s a Baybayin Script.\n Character Na.\n\n');

elseif Label1==11
    fprintf('It''s a Baybayin Script.\n Character Nga.\n\n');
    
elseif Label1==12
    fprintf('It''s a Baybayin Script.\n Character O/U.\n\n');

elseif Label1==13
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Pa.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ya.\n\n');
    end
    
elseif Label1==14
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Ha.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Sa.\n\n');
    end
    
elseif Label1==15
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character La.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ta.\n\n');
    end
    
elseif Label1==16
    fprintf('It''s a Baybayin Script.\n Character Wa.\n\n');

elseif Label1==17    
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    fprintf('It''s a Baybayin Script.\n Character Pa.\n\n');
    elseif lab==-1 
    fprintf('It''s a Baybayin Script.\n Character Ya.\n\n');
    end
end

end




    
    
    
    
    