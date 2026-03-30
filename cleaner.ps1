$html = Get-Content -Raw -Path 'index.html'

$orderedReplacements = @(
    @{'Old'=' style="display: flex; align-items: center; gap: 0.5rem; transition: none;"'; 'New'=' class="flex-center"'},
    @{'Old'=' style="height: 30px; width: auto;"'; 'New'=' class="img-sm"'},
    @{'Old'=' class="btn btn-primary magnetic" style="padding: 1rem 2rem; font-size: 1.125rem;"'; 'New'=' class="btn btn-primary btn-md magnetic"'},
    @{'Old'=' class="btn btn-outline hover-glow magnetic" style="padding: 1rem 2rem;"'; 'New'=' class="btn btn-outline hover-glow btn-md magnetic"'},
    @{'Old'=' style="max-width: 480px; margin: 0 auto; display: block;"'; 'New'=' class="img-hero"'},
    @{'Old'=' style="grid-column: span 1;"'; 'New'=' class="col-1"'},
    @{'Old'=' style="font-size: 1.875rem;"'; 'New'=''},
    @{'Old'=' style="max-width: 42rem;"'; 'New'=' class="max-w-md"'},
    @{'Old'='<h3 class="font-headline" style="font-size: 1.875rem;">'; 'New'='<h3 class="font-headline title-lg">'},
    @{'Old'=' style="font-size: 1.125rem; font-style: italic; margin-bottom: 1rem; color: rgba(204, 195, 217, 0.7);"'; 'New'=' class="text-quote"'},
    @{'Old'=' style="font-weight: 700; display: flex; align-items: center; gap: 0.5rem;"'; 'New'=' class="flex-gap text-bold"'},
    @{'Old'=' style="overflow: hidden;"'; 'New'=' class="overflow-hidden"'},
    @{'Old'=' style="font-size: 1.25rem; font-weight: 700; margin-bottom: 1.5rem;"'; 'New'=' class="text-lead"'},
    @{'Old'=' style="font-size: 2.5rem; margin-bottom: 1.5rem; display: block;"'; 'New'=''},
    @{'Old'=' style="font-size: 1.25rem; font-weight: 700; margin-bottom: 0.5rem;"'; 'New'=''},
    @{'Old'=' style="font-size: 0.875rem;"'; 'New'=''},
    @{'Old'=' style="position: relative; z-index: 10;"'; 'New'=' class="z-10"'},
    @{'Old'=' style="font-size: 1.25rem; font-weight: 700; margin-bottom: 1rem;"'; 'New'=''},
    @{'Old'=' style="font-size: 0.875rem; margin-bottom: 1.5rem;"'; 'New'=''},
    @{'Old'=' style="margin-top: 3rem;"'; 'New'=' class="mt-lg"'},
    @{'Old'=' class="btn btn-primary magnetic" style="padding: 1.25rem 2.5rem; font-size: 1.25rem;"'; 'New'=' class="btn btn-primary btn-lg magnetic"'},
    @{'Old'=' style="font-weight: 700; font-size: 1.125rem; margin: 0.5rem 0;"'; 'New'=' class="text-label"'},
    @{'Old'=' style="font-size: 0.75rem; font-weight: 700; text-align: center; margin-bottom: 3rem; opacity: 0.5;"'; 'New'=' class="text-muted"'},
    @{'Old'=' style="display: inline-flex; align-items: center; gap: 0.5rem; margin-bottom: 3rem;"'; 'New'=' class="alert-box"'},
    @{'Old'=' style="font-size: 0.875rem;"'; 'New'=''},
    @{'Old'=' style="font-size: 1.25rem; max-width: 42rem;"'; 'New'=' class="text-desc"'},
    @{'Old'=' class="btn btn-primary magnetic" style="padding: 1.5rem 3rem; font-size: 1.5rem; font-weight: 900;"'; 'New'=' class="btn btn-primary btn-xl magnetic"'},
    @{'Old'=' style="display: flex; align-items: center; gap: 0.5rem;"'; 'New'=' class="flex-gap"'},
    @{'Old'=' style="vertical-align: middle; margin-left: 0.5rem;"'; 'New'=' class="icon-right"'},
    @{'Old'=' style="color: rgba(204, 195, 217, 0.5);"'; 'New'=' class="text-footer"'}
)

foreach ($r in $orderedReplacements) {
    $html = $html.Replace($r.Old, $r.New)
}

Set-Content -Path 'index.html' -Value $html -Encoding UTF8

$cssAppend = @"

/* ================================== */
/* Clean Utility Classes              */
/* ================================== */
.flex-center { display: flex !important; align-items: center; gap: 0.5rem; transition: none !important; }
.flex-gap { display: flex; align-items: center; gap: 0.5rem; }
.img-sm { height: 30px; width: auto; }
.img-hero { max-width: 480px; margin: 0 auto; display: block; }
.icon-right { vertical-align: middle; margin-left: 0.5rem; }

/* Buttons Custom Sizes */
.btn-md { padding: 1rem 2rem; font-size: 1.125rem; }
.btn-lg { padding: 1.25rem 2.5rem; font-size: 1.25rem; }
.btn-xl { padding: 1.5rem 3rem; font-size: 1.5rem; font-weight: 900; }

/* Grid & Spacing */
.col-1 { grid-column: span 1; }
.max-w-md { max-width: 42rem; }
.overflow-hidden { overflow: hidden; }
.mt-lg { margin-top: 3rem; }
.z-10 { position: relative; z-index: 10; }

/* Typography Basics */
.title-lg { font-size: 1.875rem; }
.text-bold { font-weight: 700; }
.text-quote { font-size: 1.125rem; font-style: italic; margin-bottom: 1rem; color: rgba(204, 195, 217, 0.7); }
.text-lead { font-size: 1.25rem; font-weight: 700; margin-bottom: 1.5rem; }
.text-label { font-weight: 700; font-size: 1.125rem; margin: 0.5rem 0; }
.text-muted { font-size: 0.75rem; font-weight: 700; text-align: center; margin-bottom: 3rem; opacity: 0.5; }
.text-desc { font-size: 1.25rem; max-width: 42rem; }
.text-footer { color: rgba(204, 195, 217, 0.5); }

/* Components Custom Overrides */
.bento-item .icon-box .material-symbols-outlined { font-size: 1.875rem; }
.alert-box { display: inline-flex; align-items: center; gap: 0.5rem; margin-bottom: 3rem; padding: 0.5rem 1rem; border-radius: 0.5rem; background-color: rgba(255, 176, 205, 0.1); border: 1px solid rgba(255, 176, 205, 0.2); color: var(--color-secondary); }
.alert-box .material-symbols-outlined { font-size: 0.875rem; }

/* Auto Scroller Cards Cleaning */
.step-card .material-symbols-outlined,
.service-card .material-symbols-outlined { font-size: 2.5rem; margin-bottom: 1.5rem; display: block; }
.step-card h4, .service-card h4 { font-size: 1.25rem; font-weight: 700; margin-bottom: 0.5rem; }
.service-card h4 { margin-bottom: 1rem; }
.step-card p, .service-card p { font-size: 0.875rem; }
.service-card p { margin-bottom: 1.5rem; }
"@

Add-Content -Path 'style.css' -Value "`n`n$cssAppend" -Encoding UTF8
