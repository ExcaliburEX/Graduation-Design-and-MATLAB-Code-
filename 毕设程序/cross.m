function s = cross(s,m,p)
%此处的p是转弯概率
turn=s{1}.*(m==5|m==6);
[turn_1,turn_2]=find(turn);
rdp=randperm(length(turn_1));
turn_1=turn_1(rdp);
turn_2=turn_2(rdp);
for i=1:length(turn_1)
    vx=abs(s{2}(turn_1(i),turn_2(i)));
    vy=abs(s{3}(turn_1(i),turn_2(i)));
    loc=fun_loc(m,turn_1(i),turn_2(i));
    if (abs(vx)+abs(vy))==0
        if loc==1
            if m(turn_1(i),turn_2(i)-1)~=0
                if rand<=0.5
                    s{2}(turn_1(i),turn_2(i))=-1;
                else
                    s{3}(turn_1(i),turn_2(i))=+1;
                end
            else
                s{3}(turn_1(i),turn_2(i))=+1;
            end
        elseif loc==2
            if m(turn_1(i)-1,turn_2(i))~=0
                if rand<=0.5
                    s{2}(turn_1(i),turn_2(i))=-1;
                else
                    s{3}(turn_1(i),turn_2(i))=-1;
                end
            else
                s{2}(turn_1(i),turn_2(i))=-1;
            end
        elseif loc==3
            if m(turn_1(i)+1,turn_2(i))~=0
                if rand<=0.5
                    s{2}(turn_1(i),turn_2(i))=+1;
                else
                    s{3}(turn_1(i),turn_2(i))=+1;
                end
            else
                s{2}(turn_1(i),turn_2(i))=+1;
            end
        elseif loc==4
            if m(turn_1(i),turn_2(i)+1)~=0
                if rand<=0.5
                    s{2}(turn_1(i),turn_2(i))=+1;
                else
                    s{3}(turn_1(i),turn_2(i))=-1;
                end
            else
                s{3}(turn_1(i),turn_2(i))=-1;
            end
        end
    else
        if loc==1
            if m(turn_1(i),turn_2(i)-1)~=0
                if rand<=p
                    s{2}(turn_1(i),turn_2(i))=-abs(vy);
                    s{3}(turn_1(i),turn_2(i))=abs(vx);
                end
            else
                s{2}(turn_1(i),turn_2(i))=0;
                s{3}(turn_1(i),turn_2(i))=abs(vx)+abs(vy);
            end
        elseif loc==2
            if m(turn_1(i)-1,turn_2(i))~=0
                if rand<=p
                    s{2}(turn_1(i),turn_2(i))=-abs(vy);
                    s{3}(turn_1(i),turn_2(i))=-abs(vx);
                end
            else
                s{2}(turn_1(i),turn_2(i))=-(abs(vx)+abs(vy));
                s{3}(turn_1(i),turn_2(i))=0;
            end
        elseif loc==3
            if m(turn_1(i)+1,turn_2(i))~=0
                if rand<=p
                    s{2}(turn_1(i),turn_2(i))=abs(vy);
                    s{3}(turn_1(i),turn_2(i))=abs(vx);
                end
            else
                s{2}(turn_1(i),turn_2(i))=(abs(vx)+abs(vy));
                s{3}(turn_1(i),turn_2(i))=0;
            end
        elseif loc==4
            if m(turn_1(i),turn_2(i)+1)~=0
                if rand<=p
                    s{2}(turn_1(i),turn_2(i))=abs(vy);
                    s{3}(turn_1(i),turn_2(i))=-abs(vx);
                end
            else
                s{2}(turn_1(i),turn_2(i))=0;
                s{3}(turn_1(i),turn_2(i))=-(abs(vx)+abs(vy));
            end
        end
        vx=s{2}(turn_1(i),turn_2(i));
        vy=s{3}(turn_1(i),turn_2(i));
        if vx>0
            vx=1;
            %vy=0;
        elseif vx<0
            vx=-1;
            %vy=0;
        elseif vy>0
            %vx=0;
            vy=1;
        else
            %vx=0;
            vy=-1;
        end
        if s{1}(turn_1(i)+vy,turn_2(i)+vx)==0 && m(turn_1(i)+vy,turn_2(i)+vx)~=0
            s{1}(turn_1(i),turn_2(i))=0;
            s{1}(turn_1(i)+vy,turn_2(i)+vx)=1;
            s{2}(turn_1(i)+vy,turn_2(i)+vx)=s{2}(turn_1(i),turn_2(i));
            s{2}(turn_1(i),turn_2(i))=0;
            s{3}(turn_1(i)+vy,turn_2(i)+vx)=s{3}(turn_1(i),turn_2(i));
            s{3}(turn_1(i),turn_2(i))=0;
        end
    end
end
end

