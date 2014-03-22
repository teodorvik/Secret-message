function[] = generateMessage(image, text)
    ndims(image)
    if(ndims(image) > 1)
        im =  squeeze(rgb2gray(imread(image)));
    else
        im =  squeeze(imread(image));
    end
    [X,Y] = size(im);
    
    messageLength = length(text);
    
    columnDist = 50;
    howMany = 20;
    rowDist = floor(mod(Y,howMany));
    
    
    % which columns?
    im(1,Y) = columnDist;
    
    % which rows?
    im(X,1) = rowDist;
    
    % How many in each column?
    im(X, ceil(Y/2)) = howMany;
    
    % length of message
    im(X,Y) = messageLength;

    for i = 1:messageLength
        textChar(i) = letterToNumber(text(i));
    end
    
    count = 1;
    columnCount = 1;
   % test = zeros(10, 10);
 %   [X, Y] = size(test);
    
    % While there are chars to be written into the picture
    while count <= messageLength
        
        % Starts at columnpixel 1;
        column = columnDist*(columnCount - 1) + 1;
        
        % Write as many as we have desided in the column
        rowCount = 1;
        row = rowDist*(rowCount - 1) + 1;
        while row < Y
           
            % Add character
            if count <= messageLength
                im(row,column) = textChar(count);
%                 column = column
%                 row = row
%                 m = 'added'
            end
            
            % New character added - increase count
            rowCount = rowCount + 1;
            row = rowDist*(rowCount - 1) + 1;
            count = count + 1;
        end
        
        % Column complete - increase columnCount
        columnCount = columnCount + 1;
    end

    imshow(im);
    imsave
%     imsave(im);
%     finalMessage = im;
end