function data_array = load_data(dirpath, flags)
    % loads all files in given directory
    dirlist = dir(dirpath);
    fprintf('Loading data directory %s: ', dirpath);
    data_array = {};
    for i = 1:length(dirlist)
        if ~dirlist(i).isdir
            fprintf('%s ',dirlist(i).name);
            data_array{length(data_array)+1} = format_data(...
                dirlist(i).name, dirpath, flags);
        end
    end
    fprintf('\n');
end

function s = format_data(filename, dirpath, flags)
    d = load(strcat(dirpath,'/',filename),flags);
    person = str2num(filename(2));
    cls = str2num(filename(4));
    id = str2num(filename(6));
    s = struct('data', d, 'person', person, 'class', cls, 'id', id);
end