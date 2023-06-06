#!/bin/bash
wayvnc 0.0.0.0 & adb reverse tcp:5900 tcp:5900
