% First we set the domain. Here it is [0,x] with 16000
% sample points.
t = linspace(.6,.6+1/440,50); %Note the ‘ at the end

%setting lengths
timePiano = linspace(0, pianoDuration,length(piano));
timeFlute = linspace(0, fluteDuration,length(flute));

%applying Fs
firstNumber = answering_machine(1:.5*Fs);
secondNumber = answering_machine(Fs+1:1.5*Fs);

%frequency
x = 440;
specx = 1;

%checking inbetween frequencies
f2 = sin(2*pi*specx*x*t); %define the first function
g2 = cos(2*pi*specx*x*t); %define the second function

%fundemental frequency piano
fp = (FsPiano - 1)*.6 + 1;

%fundemental frequency flute
ff = (FsFlute - 1)*.6 + 1;

%sample rounding piano
pstartingSample = round(fp);
pendingSample = pstartingSample+49;

%sample rounding flute
fstartingSample = round(ff);
fendingSample = fstartingSample+49;

%sampling piano
ptimeSample = timePiano(pstartingSample:pendingSample);
pianoSample = piano(pstartingSample:pendingSample);

%sampling flute
ftimeSample = timeFlute(fstartingSample:fendingSample);
fluteSample = flute(fstartingSample:fendingSample);

%weights of each sinusoidal function piano
pcosWeight = 880*trapz(ptimeSample, transpose(pianoSample).*cos(2*pi*specx*440*ptimeSample));
psinWeight = 880*trapz(ptimeSample, transpose(pianoSample).*sin(2*pi*specx*440*ptimeSample));

%weights of each sinusoidal function flute
fcosWeight = 880*trapz(ftimeSample, transpose(fluteSample).*cos(2*pi*specx*440*ftimeSample));
fsinWeight = 880*trapz(ftimeSample, transpose(fluteSample).*sin(2*pi*specx*440*ftimeSample));


%building an array of 'A' frequencies
 for n = 1:6; 
     freq(n) = 440*n; 
 end 

%plotting piano
%pspec(1) = sqrt(cosWeight^2 + sinWeight^2);
subplot(2,1,1);
stem(freq,pspec)
axis([0 7*440 0 3000])
legend('piano')

%plotting flute
subplot(2,1,2);
stem(freq,fspec)
axis([0 7*440 0 3000])
legend('flute');

% Plot the two functions. Note we only plot the first
% 1/100th of a second.
%subplot(2,1,1); plot(timeFlute,flute);
%legend('flute'); axis([0 fluteDuration -1 1]);
%subplot(2,1,2); plot(timePiano,piano);
%legend('piano'); axis([0 pianoDuration -1 1]); 


%The 8000 is needed to tell the soundsc command the sampling frequency. 
%Here there are 8000samples per second. 

%==============================================================