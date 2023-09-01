# Fast Transfer Learning Method Using Random Layer Freezing and Feature Refinement Strategy
## Abstract:

Recent work has utilized Moore-Penrose (MP) inverse in deep convolutional neural network (DCNN) learning, which achieves better generalization performance over the DCNN with a stochastic gradient descent (SGD) pipeline. However, Yang’s work has not gained much popularity in practice due to its high sensitivity of hyper-parameters and stringent demands of computational resources. To enhance its applicability, this paper proposes a novel MP inverse-based fast retraining strategy. In each training epoch, a random learning strategy that controls the number of convolutional layers trained in the backward pass is first utilized. Then, an MP inverse-based batch-by-batch learning strategy, which enables the network to be implemented without access to industrial-scale computational resources, is developed to refine the dense layer parameters. Experimental results empirically demonstrate that fast retraining is a unified strategy that can be used for all DCNNs. Compared to other learning strategies, the proposed learning pipeline has robustness against the hyper-parameters, and the requirement of computational resources is significantly reduced.



## Contributions:
* I. Architecture side - A new batch-by-batch learning algorithm based on the MP inverse strategy for DCNN is proposed.

* II. Methodology side - A random layer freezing strategy is proposed to speed up the training.

## Related Work:

[1] Zhang, W. Fast Transfer Learning Method Using Random Layer Freezing and Feature Refinement Strategy. IEEE Transactions on Cybernetics (Under review).

### Caltech-101 (Visual Image Classification Domain)
* Caltech-101 dataset: [Caltech-101 DATASET](http://www.vision.caltech.edu/Image_Datasets/Caltech101/)
* Caltech-101 (Inception-v3) features: [Caltech-101 (GoogLe Drive)](https://drive.google.com/file/d/1bAEyrkgYC8VahR3uLIlF6qJe2A0MczZA/view?usp=sharing)
* Caltech-101 (Inception-v3) features: [Caltech-101 (Github)](https://github.com/1027051515/Experimental_Validation/blob/main/Caltech101_inc_lfi_tra5f_da%5B1%5D.mat)
* Source code for evaluating batch-by-batch strategy: [Caltech-101](https://github.com/1027051515/Experimental_Validation/blob/main/Main_file.m)

## Dependancies
* Matlab 

## Reproduce the Experimental Results

Run script "Main_file.m" for reproduciility.

#Set "Onebatchlearning = 2" for batch-by-batch learning; Set "Onebatchlearning = 1" for one-batch learning

#The obtained "beta" gives the calculated weights. This experiment verifies the two modes give the same weights.
