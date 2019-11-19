function FinishControlCycle = FallingTrigger(State, lastState)
    if lastState > 0 && State <= 0
        FinishControlCycle = true;

    elseif lastState < 0 && State >= 0
        FinishControlCycle = true;

    else 
        FinishControlCycle = false;
    end
end

