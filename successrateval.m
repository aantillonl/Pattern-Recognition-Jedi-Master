function pc=successrateval(vec1,vec2)
    if length(vec1) < length(vec2)
        L = length(vec1);
    else
        L = length(vec2);
    end
    ok = 0;
    for i=1:L
        if vec1(i) == vec2(i)
            ok = ok + 1;
        end
    end
    pc=ok/L;
