#!/bin/bash
# =============================================
# DAILY SEO AUTOMATION - One command does it all
# Run: bash daily-seo.sh
# =============================================

DATE=$(date +"%Y-%m-%d")
POST_LOG="social-posts/posted.txt"
BLOG_DIR="blog"

echo "========================================"
echo "  DAILY SEO - $DATE"
echo "========================================"

# Step 1: Open OpenCode to create a new blog post
echo ""
echo "[1/4] Creating SEO blog post with OpenCode..."
echo "OpenCode will ask what keyword you want to target."
echo "Type a keyword like: 'relationship counseling in Lahore'"
echo ""

# Run OpenCode with a prompt
opencode << 'EOF'
I am running my daily SEO task. Create one new blog post for my psychology website at /home/zubair/Professional-psychologist-Lahore.
Target a keyword I will tell you. 
The post must:
- Have proper HTML structure with the same style as my site
- Include a JSON-LD Article schema
- Include WhatsApp CTA and Calendly booking links
- Have internal links to services.html
- Be saved in the blog/ folder
- Add the post to sitemap.xml

Ask me what keyword to target, then create the post.
EOF

echo ""
echo "[2/4] Blog post created (if you completed the step above)"

# Step 2: Generate social media posts for today
echo ""
echo "[3/4] Generating today's social media post..."
echo ""

POSTS_FILE="social-posts/today.txt"
cat > "$POSTS_FILE" << EOP
========================================
SOCIAL MEDIA POST - $DATE
========================================

[FACEBOOK POST]:
Need someone to talk to? I offer online therapy for anxiety,
depression, and relationship issues — in Urdu, English, and Punjabi.
Free 15-min consultation: https://wa.me/923187036719
#MentalHealthPakistan #OnlineTherapy #Lahore

[LINKEDIN POST]:
As a Clinical Psychologist, I've seen how online therapy transforms
lives. If you or someone you know is struggling, reaching out is
the first step. Free consultation: https://calendly.com/mzpakistani9

[WHATSAPP STATUS]:
Online therapy available today. Book your free consultation:
https://wa.me/923187036719

========================================
After posting, run: bash daily-seo.sh --done
========================================
EOP

echo "  Today's posts saved to: $POSTS_FILE"
echo "  Open it and copy-paste to Facebook, LinkedIn, WhatsApp"
echo ""

# Step 3: Push to GitHub
echo "[4/4] Pushing changes to GitHub..."
git add -A
git commit -m "Daily SEO update - $DATE"
git push

echo ""
echo "========================================"
echo "  DONE! Tasks completed for $DATE"
echo "========================================"
echo ""
echo "What to do now:"
echo "  1. Open: xdg-open social-posts/today.txt"
echo "  2. Copy-paste posts to Facebook & LinkedIn"
echo "  3. Reply to WhatsApp messages if any"
echo "  4. Check Google Search Console for traffic"

# If --done flag, log today as completed
if [ "$1" = "--done" ]; then
    echo "$DATE - POSTED" >> "$POST_LOG"
    echo "  Logged as completed"
fi
