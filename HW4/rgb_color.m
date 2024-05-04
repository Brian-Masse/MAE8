function color = rgb_color(rgb)
% takes in an inpute vector containings either 1 or 0 to represent the
% active red, green, or blue channles in a given color
% the function returns a string describing the color

invalid = (rgb > 1 | rgb < 0);
if sum(invalid) > 0
    color = 'Invalid input';
    return
end

% checks if the value is white
if sum(rgb) == 3
    color = "white";
    return
end

% checks for remaining colors with a red channel
if rgb(1) == 1
    if rgb(2) == 1
        color = "yellow";
        return

    elseif rgb(3) == 1
        color = "magenta";
        return
    
    else 
        color = "red";
        return
    end
end 

% checks for remaining colors with a blue channel
if rgb(3) == 1
    if rgb(2) == 1
        color = "cyan";
        return

    else 
        color = "blue";
        return
    end
end

% checks for remaining colors with a green channel
if rgb(2) == 1
    color = "green";
    return
end

color = "black";
return
end