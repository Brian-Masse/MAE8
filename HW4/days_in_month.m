function days = days_in_month(month, leap)
% takes a month, passed as a 3 letter string, and leap, a boolean
% indicating whether the current year is a leap year or not
% and returns the nuber of days in that month

switch month
    case 'jan'
        days = 31;
        return
    case 'feb'
        if leap 
            days = 29;
        else 
            days = 28;
        end
        return 
    case 'mar'
        days = 31;
        return
    case 'apr'
        days = 30;
        return
    case 'may'
        days = 31;
        return
    case 'jun'
        days = 30;
        return
    case 'jul'
        days = 31;
        return
    case 'aug'
        days = 31;
        return
    case 'sep'
        days = 30;
        return
    case 'oct'
        days = 31;
        return
    case 'nov'
        days = 30;
        return
    case 'dec'
        days = 31;
        return

    otherwise 
        days = 'Invalid inputs';
        return 
end
