clear all;
load Caltech101_inc_lfi_tra5f_da.mat;
X_train=trainingFeatures(:,2:end);
T_train=trainingFeatures(:,1);

sorted_target=sort(T_train',2);
TrainingNO_save=size(T_train,1);

label=zeros(1,1);                               %Find and save in 'label' class label from training and testing data sets
label(1,1)=sorted_target(1,1);
j=1;
for i = 2:size(sorted_target,2)
    if sorted_target(1,i) ~= label(1,j)
        j=j+1;
        label(1,j) = sorted_target(1,i);
    end
end
OutputNO=j;
%%%%%%%%%% Processing the targets of training
temp_T=zeros(TrainingNO_save, OutputNO);    %get the expect result of the training data.ï¿½ï¿½ï¿?Tï¿½ï¿½ï¿½ï¿½
for i = 1:TrainingNO_save
    for j = 1:OutputNO
        if label(1,j) == T_train(i,1)
            break;
        end
    end
    temp_T(i,j)=1;
end
T_train=temp_T;

TrainingNO=size(X_train,2);
HiddenNO=size(X_train,1);

%% Hypperparameters;
C=2^2;
Onebatchlearning = 2;
batch_num=100;

%% [1] One-batch
if Onebatchlearning == 1
    beta=(eye(size(X_train,2))/C+X_train'*X_train)^(-1)*X_train'*T_train;
    beta
end
%% [2] Batch-by-batch
if Onebatchlearning == 2
    TrainingNO_save=size(X_train,1);
    for i=1:batch_num
        TrNO=round(TrainingNO_save/batch_num);
        X_train_batch{i}=X_train(TrNO*(i-1)+1:min(TrNO*i,TrainingNO_save),:);
        T_train_batch{i}=T_train(TrNO*(i-1)+1:min(TrNO*i,TrainingNO_save),:);
    end
    for i = 1:batch_num
        if i == 1
            K=(eye(size(X_train_batch{i},2))/C+X_train_batch{i}'*X_train_batch{i})^(-1);
            beta=(eye(size(X_train_batch{i},2))/C+X_train_batch{i}'*X_train_batch{i})^(-1)*X_train_batch{i}'*T_train_batch{i};
        else
            K_p = eye(size(X_train_batch{i},2)) - K*X_train_batch{i}'*(X_train_batch{i}*K*X_train_batch{i}' + eye(size(X_train_batch{i},1)))^(-1)*X_train_batch{i};
            K = K_p*K;
            beta=K_p*beta_save'+K*X_train_batch{i}'*T_train_batch{i};
        end
        beta=beta';
        beta_save=beta;
    end
    beta=beta';
end