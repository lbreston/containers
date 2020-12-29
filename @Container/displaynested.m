%Displays properties of nested containers 

function displaynested(C)
whosout = whos('C');
sizes = whosout.size;
sizestr = [int2str(sizes(1)),'x',int2str(sizes(2))];
endstr = [': [' sizestr '] ' whosout.class];
disp([inputname(1) endstr]);
if isa(C,'Container')
    recursor(C,0,'');
end
disp(' ');
end
function recursor(C,level,recstr)

recstr = [recstr '  |'];


fnames = properties(C);
for i = 1:length(fnames)
   
    tmpstruct = C.(fnames{i});
  
    whosout = whos('tmpstruct');
    sizes = whosout.size;
    sizestr = [int2str(sizes(1)),'x',int2str(sizes(2))];
    if isequal(whosout.class,'string')
        tmpcell=cellfun(@(x)["[",string(x),"]"],tmpstruct,'UniformOutput',false);
        endstr = char(strjoin([":",tmpcell{:}],' '));
    elseif isequal(whosout.class,'cell')
        tmpcell=cellfun(@dvstr,tmpstruct,'UniformOutput',false);
        endstr = char(strjoin([":",tmpcell{:}],' '));
    else
        endstr = [': [' sizestr '] ' whosout.class];
    end
    
    if i == length(fnames) 
        str = [recstr(1:(end-1)) '''--' fnames{i} endstr];
        recstr(end) = ' ';
    else 
        str = [recstr '--' fnames{i} endstr];
    end
    disp(str);
    
    if isa(tmpstruct,'Container')
        if isconsistent(tmpstruct)
            recursor(tmpstruct,level+1,recstr);
        end
    end
    
end
end

function str = dvstr(x)
if numel(x)<=6
    str=["[",string(x),"]"];
else
    str=["[" string(x(1:3)) "..." string(x(end-1:end)) "]"];
end
end