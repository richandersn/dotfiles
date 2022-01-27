function unlock
    if not ssh-add -l > /dev/null
        ssh-add
    else
        echo "SSH key unlocked."
    end
end
