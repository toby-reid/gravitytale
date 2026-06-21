/// @desc arrow/face

m_continueArrowIndex = (m_continueArrowIndex + 1) % 2;
head_frame = (charCount < m_charCountTarget) ? ((head_frame + 1) % 2) : 0;

alarm[1] = m_continueArrowSpeed;
