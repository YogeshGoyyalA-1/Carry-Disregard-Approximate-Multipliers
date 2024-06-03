# Carry Disregard Approximate Multipliers

Implemented the paper "Carry Disregard Approximate Multipliers" ,published in IEEE Transactions on Circuit and Systems, December 2023

The implemented approximate multipliers are categorized into two types: CDM8 for 8-bit multipliers and CDM16 for 16-bit multipliers. 

Each directory has Verilog codes for the approximate multipliers and a Python code to calculate the accuracy criteria. Cadence Genus was employed to synthesize the multipliers using both 45nm NanGate and 45nm gptk technology libraries to derive crucial metrics such as Area, Power, and Delay. These metrics serve as vital indicators of the performance and efficiency of the implemented multipliers. 

The approximate multiplier was applied in low-pass filtering for image processing. Performance evaluation relied on Peak Signal-to-Noise Ratio (PSNR) and Structural Similarity Index Measure (SSIM) to gauge image quality.

### Steps to run:

* Clone the repository.

* Navigate to any directory and execute the main and testbench files. For example, for cdm8_73, please run `cdm8_73.v` and `cdm8_73_tb.v`. Then, run `python_compare_cdm8.py` . The terminal will display the accuracy values of the approximate multipliers.

* Next, synthesize cdm8_73 using the Cadence Genus tool to obtain the Hardware Efficiency Criteria(Power, Area, and Delay). 

Feel free to raise an issue for any queries related to implementation.
