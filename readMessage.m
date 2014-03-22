function[finalMessage] = readMessage(image)
% im =  squeeze(im2double(rgb2gray(imread(image))));
    im =  squeeze(imread(image));
    [X,Y] = size(im);

    % which columns?
    columnDist = im(1,Y)
    
    % which rows?
    rowDist = im(X,1)
    
    % How many in each column?
    howMany = im(X, ceil(Y/2))
    
    % length of message
    messageLength = im(X,Y);

    
    count = 1;
    columnCount = 1;    
    textChar = zeros(1,length(messageLength));
    % While there are chars to be written into the picture
    while count <= messageLength
        
        % Starts at columnpixel 1;
        column = columnDist*(columnCount - 1) + 1;
        
        % Write as many as we have desided in the column
        rowCount = 1;
        row = rowDist*(rowCount - 1) + 1;
        while row < Y && rowCount < howMany + messageLength
            % Add character
            if count <= messageLength       
                val = im(row,column);
                character = char(val);
                textChar(count) = character;
            end
            
            % New character added - increase count
            rowCount = rowCount + 1;
            row = rowDist*(rowCount - 1) + 1;
            count = count + 1;
        end
        
        % Column complete - increase columnCount
        columnCount = columnCount + 1;
    end
    
    for i = 1:messageLength
        finalMessage(i) = char(textChar(i));
    end

end