module App.P3 {
    'use strict';

    export class DialogService {
        private resources;
        private dialogStyle;
        private data;
        private setCommonTrialWindowText;
        private fillTemplate;

        // @ngInject
        constructor(
            private ngDialog: any,
            private appService: AppService
        ) {
            this.dialogStyle = this.appService.nagStyle();
        }

        public init(opts) {
            this.resources                  = opts.resources;
            this.data                       = opts.data;
            this.setCommonTrialWindowText   = opts.setCommonTrialWindowText;
            this.fillTemplate               = opts.fillTemplate;
        }

        public openCommonDialog() {
            let template = {
                avAssistantWindowCommon:    this.resources.avAssistantWindowCommon,
                siriAssistantWindowCommon:  this.resources.siriAssistantWindowCommon,
                oneDollarOfferWindow:       this.resources.oneDollarOfferWindowCommon,
                adultReachLimitWindow:      this.resources.adultReachLimitWindowCommon
            }

            let dialogOpts = {
                templateUrl: 'ng/views/common/modals/trialExceedWindow-common.html',
                className: 'TE-modal-container TE-modal-container--width-700',
                trialWindowText: this.setCommonTrialWindowText
            }

			switch (this.dialogStyle) {
                case 'Siri':
                    dialogOpts.templateUrl = 'ng/views/common/modals/siriAssistantWindow.html';
                    dialogOpts.className = 'SA-modal';
                    dialogOpts.trialWindowText = () => this.fillTemplate(template.siriAssistantWindowCommon, 
                        [this.data.totalIssueCount, 'issues']);
                    break;
                case 'OneDollar':
                    dialogOpts.templateUrl = 'ng/views/common/modals/oneDollarOfferWindow.html';
                    dialogOpts.className = 'OD-offer-modal';
                    dialogOpts.trialWindowText = () => this.fillTemplate(template.oneDollarOfferWindow, 
                        [this.data.totalIssueCount, 'issues']);
                    break;
                case 'AV':
                    dialogOpts.templateUrl = 'ng/views/common/modals/avAssistantWindow.html';
                    dialogOpts.className = 'AV-assistant-modal';
                    dialogOpts.trialWindowText = () => this.fillTemplate(template.avAssistantWindowCommon, 
                        [this.data.totalIssueCount, 'issues']);
                    break;
                case 'AdultRL':
                    dialogOpts.templateUrl = 'ng/views/common/modals/adultReachLimitWindow.html';
                    dialogOpts.className = 'TE-modal-container TE-modal-container--width-700';
                    dialogOpts.trialWindowText = () => this.fillTemplate(template.adultReachLimitWindow,
                        [`<span class="TE-modal-common__subtitle--issues">${this.data.totalIssueCount}</span>`]
                    );
                    break;
                case 'NoHasTrialFix': //todo: add
                case 'AdultIT':
                    dialogOpts.templateUrl = 'ng/views/common/modals/adultIssuesTracesWindow.html';
                    dialogOpts.className = 'TE-modal-container TE-modal-container--width-700';
                    dialogOpts.trialWindowText = () => this.fillTemplate(template.adultReachLimitWindow,
                        [`<span class="TE-modal-common__subtitle--issues">${this.data.totalIssueCount}</span>`]
                    );
                    break;
            }

            this.ngDialog.open({
                templateUrl: dialogOpts.templateUrl,
                data: {
                    setCommonTrialWindowText: dialogOpts.trialWindowText
                },
                closeByEscape: false,
                closeByDocument: false,
                name: 'TrialIssuesLimitExceedWindowCommon', // dont change plz
                className: dialogOpts.className,
                preCloseCallback: () => {
                    if (this.appService._isAutoClose)
                        console.log('isAutoClose system-stats');
                    else
                    {
                        console.log('sendStats: ButtonClick  Close');
                        this.appService.stats.onSecondaryWindowButtonClicked(
                            'Close', '', null);
                    }
                }
            });
        }

        public openPhoneActivationDialog() {
			console.info('openPhoneActivationDialog');
            this.ngDialog.open({
                templateUrl: 'ng/views/common/modals/phoneActivationWindow.html',
                closeByEscape: false,
                closeByDocument: false,
                showClose: false,
                name: 'PhoneActivationWindow',
                className: 'PA-modal',
                preCloseCallback: () => {
                    if (this.appService._isAutoClose)
                        console.log('isAutoClose system-stats');
                    else
                    {
                        console.log('sendStats: ButtonClick  Close');
                        this.appService.stats.onSecondaryWindowButtonClicked(
                            'Close', '', null);
                    }
                }
            });
        }

        public openDialog(opts) {
            this.ngDialog.open(opts);
        }

        public closeAll() {
            this.ngDialog.closeAll();
        }
    }
}