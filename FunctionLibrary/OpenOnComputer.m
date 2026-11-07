function OpenOnComputer(file)
filepath = which(file);
if isempty(filepath)
    disp("Loading the project to build the expected path...")
    openProject("../PROJECTNAME.prj")
    filepath = which(file);
end
if ismac
    % Code to run on Mac platform
    syscmd = ['open "', filepath, '" &'];
    disp("Running on Mac")
    system(syscmd);
elseif isunix
    % Code to run on Linux platform
    web(filepath)
elseif ispc
    % Code to run on Windows platform
    disp("Running on Windows")
    winopen(filepath)
else
    vid = VideoReader(filepath);
    for idx=1:vid.NumFrames
        frame = read(vid,idx);
        imshow(frame)
    end
end
end

%[appendix]{"version":"1.0"}
%---
