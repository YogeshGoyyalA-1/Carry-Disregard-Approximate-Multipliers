Implemented the paper "Carry Disregard Approximate Multipliers" ,published in IEEE Transactions on Circuit and Systems, December 2023

The implemented approximate multipliers are categorized into two types: CDM8 for 8-bit multipliers and CDM16 for 16-bit multipliers. 

Each directory has codes for the approximate multipliers, the test bench and a python code to calculate the accuracy criteria. For the synthesis process, Cadence Genus was utilized to derive crucial metrics such as Area, Power, and Delay. These metrics serve as vital indicators of the performance and efficiency of the implemented multipliers.

The approximate multiplier was applied in low-pass filtering for image processing. Performance evaluation relied on Peak Signal-to-Noise Ratio (PSNR) and Structural Similarity Index Measure (SSIM) to gauge image quality.
