# Double_Simulus_Tester

A simple MATLAB GUI to preform double stimulus testing, according with the JPEG AI Common Training and Test Conditions (ITU-T SG16).

## How to Use

1. Download this repository.
2. Open MATLAB and change its directory to this repository.
3. Place all your images within the `images` folder (it should follow the JPEG AI naming scheme).
4. By running `quick_tstr` within MATLAB, you should see a new GUI showing two images, with sliders undernead (1 means bad quality, 2 means poor, 3 means Fair, 4 means Good while 5 means Excellent).
5. When you terminate one test, a csv file should appers in the `tests` folder.

## Structure of the Resulting CSV File

The first column has the name of the reference file, followed by the score it was attributed to it in the second column.
The Third column has the name of the compressed file shown, while the fourth column has the score attributed to it.
