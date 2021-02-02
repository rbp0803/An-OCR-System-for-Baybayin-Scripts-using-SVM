% ----------------------------------------------------------------------------------------
% Optical Character Recognition System for Baybayin Scripts using Support Vector Machine %                           
% by Rodney Pino, Renier Mendoza and Rachelle Sambayan                                   %
% Programmed by Rodney Pino at University of the Philippines - Diliman                   %
% Programming dates: Feb 2020 to September 2020                                          % 
% ----------------------------------------------------------------------------------------

% =============================================================== %
% Note:                                                           %
% One has to load first the needed classifiers in the workspace   %
% to complete the function inputs.                                %
% -----------------------------------------------------------------


%Mdl= SVM Model for Baybayin characters (56x56) MAT Filname: Baybayin_Character_Classifier_00379
%Mdl1= SVM Model for Latin characters (56x56)   MAT Filename: Latin_Character_Classifier_00330
%input= isolated Baybayin or Latin character image 

function [P,Posterior]=Proposed_Baybayin_OCR(Mdl, Mdl1, input)

%List of Binary classifiers which will be used for
%reclassification of confusive Baybayin characters
Confuselist={'AVSMa_00225.mat','KaVSEI_00100.mat','smile.mat',...
             'HaVSSA_00050.mat','LaVSTa_00100.mat','PaVSYa_00550.mat'};
         
%Start of preprocessing         
u=imread(input);
[~,v2]=c2bw(u);
Letter2=v2;
s=regionprops(Letter2,'basic');
ss=struct2cell(s);
S=cell2mat(ss(1,:));

%===================================================================================
%If more than one component, this part is intended for the Baybayin character 'E/I'
if length(S)>=2
    E3=max(S(S<max(S)));
    if isempty(E3)
        M=56;
        Letter=imresize(Letter2, [M M]);
        [P , Posterior]=Baybayin_letter_revised_segueway(Mdl,Letter);
        return;
    end
EE=max(S)/E3-1;
if EE<=1
    L=find(S==max(S)); 
    SS=max(S(S<max(S)));
    LL=find(S==SS);
    
    B=ss(:,L);
    BB=ss(:,LL);
    
    A=cat(1,B{3},BB{3});
    AA(1)=min(A(:,1)); AA(2)=min(A(:,2)); AA(3)=max(A(:,3)); AA(4)=abs(A(1,2)-A(2,2));
    if A(1,2)>A(2,2)
       AA(4)=AA(4)+A(1,4);
    else
       AA(4)=AA(4)+A(2,4);
    end
    
    Letter=imcrop(Letter2,AA);
    Letter=imresize(Letter,[56 56]);
    
    [P, Posterior]=seg2(Mdl,Letter,Letter2);
    return;
end
end
%-----------------------------------------------------------------------------------


%Identifying the main body's significant features or bounding box
L=find(S==max(S));

SS=max(S(S<max(S)));
LL=find(S==SS);

B=ss(:,L);
BB=ss(:,LL);

b=B{2};
b=b(2);


L=find(S==max(S));
B=ss(:,L);
A=B{3};
A(1)=A(1)-1; A(2)=A(2)-1; A(3)=A(3)+1; A(4)=A(4)+1;

%Cropping the main body with only its essential features
Letter=imcrop(Letter2,A);
M=56;
%Rescaling the cropped image
Letter=imresize(Letter, [M M]);
R1=regionprops(Letter,'Area');
R2=struct2cell(R1);
R3=cell2mat(R2(1,:));
%Denoising of the 56x56 size image
if length(R3)>=2
    R4=max(R3(R3<max(R3)));
    Letter=bwareaopen(Letter, R4+1);
else
    Letter=bwareaopen(Letter, 10);
end

%feature vector extraction
Letter1=feature_vector_extractor(Letter);

%main body classification
load LvsB_classifier_00125.mat LvsB_classifier_00125 ; 
[LABEL, ~]=predict(LvsB_classifier_00125,Letter1);

%If classified as Latin
if LABEL==1
 fprintf('It''s a Latin script.\n');
 [P, Posterior]=Latin_Letter_guesser(Mdl1, Letter1);
 return;
else
%----------------------------------------------------

%======If classified as Baybayin=====================================

%Denoising components with at most 50 pixels from the input's binarized image
Letter2=bwareaopen(Letter2, 50);    
s=regionprops(Letter2,'basic');
ss=struct2cell(s);
S=cell2mat(ss(1,:));

%Classification of Baybayin characters
if length(S)==1
     [P , Posterior]=Baybayin_letter_revised_segueway(Mdl,Letter);
     return;
end

L=find(S==max(S));

SS=max(S(S<max(S)));
LL=find(S==SS);

B=ss(:,L);
BB=ss(:,LL);

b=B{2};
b=b(2);

bb=BB{2};
bb=bb(2);

A=B{3};
A(1)=A(1)-1; A(2)=A(2)-1; A(3)=A(3)+1; A(4)=A(4)+1;

AA=BB{3};
AA(1)=AA(1)-1; AA(2)=AA(2)-1; AA(3)=AA(3)+1; AA(4)=AA(4)+1;

if b>bb
    A(4)=abs(A(2)-AA(2))+A(4);
    A(2)=AA(2);
else
A(4)=abs(AA(2)-A(2))+AA(4);
end

Letter=imcrop(Letter2,A);
Letter=imresize(Letter, [M M]);
Q=regionprops(Letter,'Area');
Q=struct2cell(Q);
Q=cell2mat(Q);
Q1=max(Q);
Q2=max(Q(Q<max(Q)));
if length(Q)>=2 && Q2<250
    
    if Q2>13
 %For two or more component case (Baybayin character with a diacritic)       
        [P, Posterior]=seg(Mdl,Letter);
        return;
    else
        [P,Posterior]=Baybayin_letter_revised_segueway(Mdl,Letter);
        return;
    end

else

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

end

end
    
          