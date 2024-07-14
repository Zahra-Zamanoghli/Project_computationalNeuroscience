# Project-Computational-Neuroscience
This repository is about project of computational neuroscience 

## 1.Problem statement
The goal of this project is to analyze neuronal activity in the Middle Temporal (MT) area of the macaque monkey brain in response to complex visual stimuli. We aim to understand how MT neurons process and encode information about motion in natural visual scenes, focusing on both excitatory and suppressive components of neuronal responses.

## 2.Related works
Previous studies have investigated various aspects of MT neuronal responses, including:
- Selectivity for motion direction and speed (Maunsell and Newsome, 1987)
- Suppressive surrounds in MT receptive fields (Allman et al., 1985; Born, 2000)
- Responses to complex motion patterns (Lagae et al., 1994; Simoncelli and Heeger, 1998)
Our project builds on these works by examining neuronal responses to more naturalistic stimuli and analyzing the interplay between excitation and suppression.

## 3.Proposed Method
We propose to use a hierarchical model to interpret MT neuronal responses to natural optic flow stimuli. This model incorporates nonlinear features related to upstream processing in primary visual cortex (V1). We will analyze both the spatial and temporal structure of excitatory and suppressive effects on MT neurons.

## 4.Implementation

### 4.1. Dataset
Dataset: MT-1 from CRCNS (Collaborative Research in Computational Neuroscience)
Source: https://crcns.org/data-sets/vc/mt-1/about
Task: Macaque monkeys viewed natural optic flow stimuli while MT neuronal activity was recorded
Channels: 84 electrodes, each recording from a single neuron
Number of trials: Varies by neuron, typically hundreds of trials per neuron

### 4.2. Model
We will implement a hierarchical model that includes:
1. A front-end simulating V1 processing
2. A stage representing MT excitation, with spatial and directional tuning
3. Multiple suppressive components, including:
   - A direction-untuned component for normalization
   - A direction-tuned component with variable preferred directions

The model will be fitted to the spike train data using maximum likelihood estimation.


### 4.3. Evaluate
We will evaluate our model using the following metrics:
1. Goodness of fit: Likelihood of the observed spike trains given the model
2. Predictive power: Cross-validated performance on held-out data
3. Fano Factor and Coefficient of Variation (CV) to assess response variability
4. Comparison of model predictions to observed Raster plots and Firing Rate plots


Additionally, we will use the fitted models to simulate responses to novel stimuli and assess the model's ability to capture complex motion selectivity in MT neurons.
