function imageSliderGUI
    global idx;
    global cols;
    global pairs;
    global csvName;
    global csvData;

    cols = [1,2];
    pairs = checkExistingFiles('images/*.png');
    csvName = strcat("tests/subjectiveTest_", string(floor(rem(now,1)*10000000)), ".csv");
    csvData = cell(size(pairs,1), 4);
    idx = 1;
    
    % Create a figure
    fig = uifigure('Name', 'Image Slider GUI', 'Position', [100, 100, 800, 400]);

    % Create UI components
    img1Axes = axes(fig, 'Position', [0.05, 0.2, 0.4, 0.7]);
    img2Axes = axes(fig, 'Position', [0.55, 0.2, 0.4, 0.7]);

    slider1 = uislider(fig, 'Limits', [0, 5], 'Value', 2.5, ...
        'Position', [100, 35, 200, 3], 'ValueChangedFcn', @sliderCallback1);
    slider1.MajorTicks = [0 1 2 3 4 5];
    slider1.MinorTicks = [];

    slider2 = uislider(fig, 'Limits', [0, 5], 'Value', 2.5, ...
        'Position', [500, 35, 200, 3], 'ValueChangedFcn', @sliderCallback2);
    slider2.MajorTicks = [0 1 2 3 4 5];
    slider2.MinorTicks = [];

    button = uibutton(fig, 'Text', 'Save and Next', ...
        'Position', [350, 50, 100, 30], 'ButtonPushedFcn', @buttonCallback);

    % Initialize image and slider values
    cols = cols(randperm(length(cols)));
    img1 = imshow(imread(strcat("./images/",pairs(idx,cols(1)))), 'Parent', img1Axes);
    img2 = imshow(imread(strcat("./images/",pairs(idx,cols(2)))), 'Parent', img2Axes);
    
    % Store handles in a UserData struct for easy access
    handles = struct('fig', fig, 'img1Axes', img1Axes, 'img2Axes', img2Axes, ...
        'slider1', slider1, 'slider2', slider2, 'button', button, ...
        'img1', img1, 'img2', img2);
    fig.UserData = handles;

    % Callback functions
    function sliderCallback1(src, ~)
        % Access the slider value using src.Value
        disp(['Slider 1 Value: ', num2str(src.Value)]);
        % Add your slider1 callback logic here
    end

    function sliderCallback2(src, ~)
        % Access the slider value using src.Value
        disp(['Slider 2 Value: ', num2str(src.Value)]);
        % Add your slider2 callback logic here
    end

    function buttonCallback(~, ~)
        % Save the information to a file
        saveToFile(handles);
        idx = idx + 1;

        % Check if we reached the end of the image list
        if idx > size(pairs,1)
            writecell(csvData, csvName);
            msgbox('End of images reached.', 'Info', 'warn');
            close(handles.fig);
        else
            % Load and display the next pair of images
            cols = cols(randperm(length(cols)));
            img1 = imread(strcat("./images/",pairs(idx,cols(1))));
            img2 = imread(strcat("./images/",pairs(idx,cols(2))));
            imshow(img1, 'Parent', handles.img1Axes);
            imshow(img2, 'Parent', handles.img2Axes);

            % Reset sliders to default values
            handles.slider1.Value = 2.5;
            handles.slider2.Value = 2.5;
        end
    end

    function saveToFile(handles)
        if cols(1) == 1
            csvData{idx, 1} = pairs(idx,cols(1));
            csvData{idx, 2} = handles.slider1.Value;
            csvData{idx, 3} = pairs(idx,cols(2));
            csvData{idx, 4} = handles.slider2.Value;
        else
            csvData{idx, 1} = pairs(idx,cols(2));
            csvData{idx, 2} = handles.slider2.Value;
            csvData{idx, 3} = pairs(idx,cols(1));
            csvData{idx, 4} = handles.slider1.Value;
        end
    end
end

function pairs = checkExistingFiles(path)
    imageFiles = dir(path);
    aux = [];
    for i=1:numel(imageFiles)
        aux = [aux string(imageFiles(i).name)];
    end
        allFiles = ["00001_TE_2096x1400_8bit_sRGB.png"
                "00002_TE_2144x1424_8bit_sRGB.png"
                "00003_TE_1944x1296_8bit_sRGB.png"
                "00004_TE_1808x1352_8bit_sRGB.png"
                "00005_TE_1336x872_8bit_sRGB.png"
                "00006_TE_1544x1120_8bit_sRGB.png"
                "00007_TE_1472x976_8bit_sRGB.png"
                "00008_TE_1912x1272_8bit_sRGB.png"
                "00009_TE_1976x1312_8bit_sRGB.png"
                "00010_TE_1744x1160_8bit_sRGB.png"
                "00011_TE_1512x2016_8bit_sRGB.png"
                "00012_TE_1920x1280_8bit_sRGB.png"
                "00013_TE_3680x2456_8bit_sRGB.png"
                "00014_TE_3680x2456_8bit_sRGB.png"
                "00015_TE_1744x2000_8bit_sRGB.png"
                "00016_TE_1192x832_8bit_sRGB.png"
                "00017_TE_1280x848_8bit_sRGB.png"
                "00018_TE_3032x1856_8bit_sRGB.png"
                "00019_TE_1920x1080_8bit_sRGB.png"
                "00020_TE_3680x2456_8bit_sRGB.png"
                "00021_TE_2192x1520_8bit_sRGB.png"
                "00022_TE_1248x832_8bit_sRGB.png"
                "00023_TE_2464x1640_8bit_sRGB.png"
                "00024_TE_1536x1024_8bit_sRGB.png"
                "00025_TE_1984x1320_8bit_sRGB.png"
                "00026_TE_1784x1296_8bit_sRGB.png"
                "00027_TE_3680x2456_8bit_sRGB.png"
                "00028_TE_800x1200_8bit_sRGB.png"
                "00029_TE_976x1472_8bit_sRGB.png"
                "00030_TE_560x888_8bit_sRGB.png"
                "00031_TE_1752x1856_8bit_sRGB.png"
                "00032_TE_7680x5120_8bit_sRGB.png"
                "00033_TE_2120x1608_8bit_sRGB.png"
                "00034_TE_1072x928_8bit_sRGB.png"
                "00035_TE_877x1658_8bit_sRGB.png"
                "00036_TE_998x1675_8bit_sRGB.png"
                "00037_TE_5616x3744_8bit_sRGB.png"
                "00038_TE_8160x6120_8bit_sRGB.png"
                "00039_TE_5464x3640_8bit_sRGB.png"
                "00040_TE_7394x4932_8bit_sRGB.png"
                "00041_TE_3374x5055_8bit_sRGB.png"
                "00042_TE_2787x4004_8bit_sRGB.png"
                "00043_TE_945x840_8bit_sRGB.png"
                "00044_TE_1430x1834_8bit_sRGB.png"
                "00045_TE_2533x1897_8bit_sRGB.png"
                "00046_TE_2816x1878_8bit_sRGB.png"
                "00047_TE_2500x1875_8bit_sRGB.png"
                "00048_TE_2500x1667_8bit_sRGB.png"
                "00049_TE_5566x3569_8bit_sRGB.png"
                "00050_TE_3976x2652_8bit_sRGB.png"];

    [refs,~] = intersect(allFiles,aux);

    encoders = ["VVC_", "VM_"];
    % encoders = ["VVC_"];
    bppsVVC = ["_8bit_sRGB_006.png", "_8bit_sRGB_012.png", "_8bit_sRGB_025.png", "_8bit_sRGB_050.png", "_8bit_sRGB_075.png"];
    bppsVM = ["_006.png", "_012.png", "_025.png", "_050.png", "_075.png"];
    % bppsVVC = ["_8bit_sRGB_006.png"];

    pairs = [];
    for s=1:numel(refs)
        for e=1:numel(encoders)
            for b=1:numel(bppsVVC)
                if e == 1
                    t = extractBefore(refs(s), ".");
                    t = strcat(encoders(e), t, bppsVVC(b));
                else
                    t = extractBefore(refs(s), ".");
                    t = strcat(encoders(e), t, bppsVM(b));
                end
                pairs = [pairs; [refs(s) t]];
            end
        end
    end
    pairs = pairs(randperm(size(pairs, 1)), :);
end
