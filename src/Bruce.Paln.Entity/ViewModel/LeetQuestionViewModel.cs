﻿using System;

namespace Bruce.Paln.Entity.ViewModel
{
    public class LeetQuestionViewModel
    {
        public int TotalAcs { get; set; }
        public string QuestionTitle { get; set; }
        public string QuestionArticleSlug { get; set; }
        public int TotalSubmitted { get; set; }
        public string QuestionTitleSlug { get; set; }
        public bool? QuestionArticleLive { get; set; }
        public bool QuestionHide { get; set; }
        public int QuestionId { get; set; }
        public int Level { get; set; }
        public bool IsFavor { get; set; }
        public bool PaidOnly { get; set; }
        public int Frequency { get; set; }
        public int Progress { get; set; }

        public string Answer { get; set; }
        public int Status { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime UpdateTime { get; set; }

    }
}
