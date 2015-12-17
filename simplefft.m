function [f,P1]=simplefft(X,Fs)
    % Calculate FFT of a signal X
    % X: Nx1 vector
    % Fs: integer value, sample rate

    % remove the linear trend causing peaks at 0 Hz
    X = detrend(X);

    % Number of samples
    L=length(X);

    % Compute the Fourier transform of the signal.
    Y = fft(X);

    % Compute the two-sided spectrum P2. Then compute the single-sided
    % spectrum P1 based on P2 and the even-valued signal length L.
    P2 = abs(Y/L);
    P1 = P2(1:floor(L/2)+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;